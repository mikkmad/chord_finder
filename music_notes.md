# Converting Hertz to Musical Notes

The relationship is logarithmic: every octave doubles the frequency, and an octave is split into 12 equal semitones (in standard 12-tone equal temperament). So the number of semitones between a frequency *f* and A4 is:

$$
n = 12 \cdot \log_2\left(\frac{f}{440}\right)
$$

A convenient form uses MIDI note numbers, where A4 = 69:

$$
\text{midi} = 69 + 12 \cdot \log_2\left(\frac{f}{440}\right)
$$

Round that to the nearest integer to get the note. The leftover fraction tells you how far out of tune it is, measured in **cents** (1 semitone = 100 cents).

## Example: 532 Hz

- 12 · log₂(532 / 440) ≈ 3.287 semitones above A4
- Midi ≈ 72.287 → rounds to 72, which is **C5** (523.25 Hz)
- The 0.287 remainder means it's about **29 cents sharp** of C5

The inverse, from note to frequency, is:

$$f = 440 \cdot 2^{(\text{midi} - 69)/12}$$

## Python implementation

```python
import math

NOTE_NAMES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

def freq_to_note(f, a4=440.0):
    midi = 69 + 12 * math.log2(f / a4)
    nearest = round(midi)
    cents = (midi - nearest) * 100
    name = NOTE_NAMES[nearest % 12]
    octave = nearest // 12 - 1
    return f"{name}{octave}", cents

print(freq_to_note(532))  # ('C5', 28.7...)
```

The same logic ports directly to Java, Kotlin, or C#. In Java and C#, compute log₂ as `Math.log(x) / Math.log(2)`. Also, in Java, use `Math.floorMod` for the `% 12` step so that negative values still map to a valid note.

## Considerations for a chord analyzer

- **Getting frequencies from audio:** You'll need an FFT (or a pitch detector like YIN or autocorrelation for single notes). FFT bin resolution is `sampleRate / windowSize`, so low notes need large windows. Near E2 (~82 Hz), adjacent semitones are only about 5 Hz apart.
- **Harmonics:** A single played note also produces peaks at 2f, 3f, 4f, and so on. The 3rd harmonic lands near a perfect fifth, so naive peak-picking will "hear" notes that weren't played.
- **Pitch class profiles (chroma):** A common approach is to fold all detected energy into 12 bins (`nearest % 12`), ignoring octave. You then match that 12-element vector against chord templates, such as major = {0, 4, 7} and minor = {0, 3, 7} relative to the root.
