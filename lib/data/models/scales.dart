import "../constants/music_constants.dart";

/// Enum of most western scale types
enum ScaleType {
  major("Major"),
  minor("Minor"),
  augmented("Augmented"),
  diminishedHalfWhole("Diminished (Half-Whole)"),
  diminishedWholeHalf("Diminished (Whole-Half)"),
  dorian("Dorian"),
  phrygian("Phrygian"),
  lydian("Lydian"),
  mixolydian("Mixolydian"),
  locrian("Locrian"),
  majorPentatonic("Major Pentatonic"),
  minorPentatonic("Minor Pentatonic"),
  harmonicMinor("Harmonic Minor"),
  melodicMinor("Melodic Minor"),
  blues("Blues"),
  wholeTone("Whole Tone"),
  harmonicMajor("Harmonic Major"),
  doubleHarmonic("Double Harmonic"),
  hungarianMinor("Hungarian Minor"),
  neapolitanMinor("Neapolitan Minor"),
  neapolitanMajor("Neapolitan Major"),
  enigmatic("Enigmatic");

  final String displayName;

  const ScaleType(this.displayName);

  static ScaleType fromDisplayName(String name) {
    return ScaleType.values.firstWhere((e) => e.displayName == name);
  }
}

/// Map collection of most western scales
final Map<ScaleType, List<int>> scalePatterns = {
  ScaleType.major: [0, 2, 4, 5, 7, 9, 11],
  ScaleType.minor: [0, 2, 3, 5, 7, 8, 10],
  ScaleType.augmented: [0, 3, 4, 7, 8, 11],
  ScaleType.diminishedHalfWhole: [0, 1, 3, 4, 6, 7, 9, 10],
  ScaleType.diminishedWholeHalf: [0, 2, 3, 5, 6, 8, 9, 11],
  ScaleType.dorian: [0, 2, 3, 5, 7, 9, 10],
  ScaleType.phrygian: [0, 1, 3, 5, 7, 8, 10],
  ScaleType.lydian: [0, 2, 4, 6, 7, 9, 11],
  ScaleType.mixolydian: [0, 2, 4, 5, 7, 9, 10],
  ScaleType.locrian: [0, 1, 3, 5, 6, 8, 10],
  ScaleType.majorPentatonic: [0, 2, 4, 7, 9],
  ScaleType.minorPentatonic: [0, 3, 5, 7, 10],
  ScaleType.harmonicMinor: [0, 2, 3, 5, 7, 8, 11],
  ScaleType.melodicMinor: [0, 2, 3, 5, 7, 9, 11],
  ScaleType.blues: [0, 3, 5, 6, 7, 10],
  ScaleType.wholeTone: [0, 2, 4, 6, 8, 10],
  ScaleType.harmonicMajor: [0, 2, 4, 5, 7, 8, 11],
  ScaleType.doubleHarmonic: [0, 1, 4, 5, 7, 8, 11],
  ScaleType.hungarianMinor: [0, 2, 3, 6, 7, 8, 11],
  ScaleType.neapolitanMinor: [0, 1, 3, 5, 7, 8, 11],
  ScaleType.neapolitanMajor: [0, 1, 3, 5, 7, 9, 11],
  ScaleType.enigmatic: [0, 1, 4, 6, 8, 10, 11],
};

/// Generates a scale from a given root note and scale type.
///
/// @param rootNote The root note of the scale.
/// @param scaleType The type of scale to generate.
///
/// @return Returns a list of notes in the generated scale.
List<String> generateScaleFromRoot(String rootNote, ScaleType scaleType) {
  final int rootNoteIndex = chromaticScaleSharps.indexOf(rootNote);
  if (rootNoteIndex == -1) {
    return [];
  }

  final List<int>? pattern = scalePatterns[scaleType];
  if (pattern == null) {
    return [];
  }

  final List<String> scaleNotes = pattern.map((interval) {
    final noteIndex = (rootNoteIndex + interval) % 12;
    return chromaticScaleSharps[noteIndex];
  }).toList();

  return scaleNotes;
}
