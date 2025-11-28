import "../constants/music_constants.dart";

/// Enum of common chord types
enum ChordType {
  major("Major"),
  minor("Minor"),
  diminished("Diminished"),
  augmented("Augmented"),
  sus2("Sus2"),
  sus4("Sus4"),
  major7("Major 7"),
  minor7("Minor 7"),
  dominant7("Dominant 7"),
  diminished7("Diminished 7"),
  halfDiminished7("Half Diminished 7"),
  augmented7("Augmented 7"),
  minorMajor7("Minor Major 7"),
  major6("Major 6"),
  minor6("Minor 6"),
  add9("Add 9"),
  major9("Major 9"),
  minor9("Minor 9"),
  dominant9("Dominant 9");

  final String displayName;

  const ChordType(this.displayName);

  static ChordType fromDisplayName(String name) {
    return ChordType.values.firstWhere((e) => e.displayName == name);
  }
}

/// Map collection of chord intervals (semitones from root)
final Map<ChordType, List<int>> chordPatterns = {
  ChordType.major: [0, 4, 7],
  ChordType.minor: [0, 3, 7],
  ChordType.diminished: [0, 3, 6],
  ChordType.augmented: [0, 4, 8],
  ChordType.sus2: [0, 2, 7],
  ChordType.sus4: [0, 5, 7],
  ChordType.major7: [0, 4, 7, 11],
  ChordType.minor7: [0, 3, 7, 10],
  ChordType.dominant7: [0, 4, 7, 10],
  ChordType.diminished7: [0, 3, 6, 9],
  ChordType.halfDiminished7: [0, 3, 6, 10],
  ChordType.augmented7: [0, 4, 8, 10],
  ChordType.minorMajor7: [0, 3, 7, 11],
  ChordType.major6: [0, 4, 7, 9],
  ChordType.minor6: [0, 3, 7, 9],
  ChordType.add9: [0, 4, 7, 14],
  ChordType.major9: [0, 4, 7, 11, 14],
  ChordType.minor9: [0, 3, 7, 10, 14],
  ChordType.dominant9: [0, 4, 7, 10, 14],
};

/// Generates a chord from a given root note and chord type.
///
/// @param rootNote The root note of the chord.
/// @param chordType The type of chord to generate.
///
/// @return Returns a list of notes in the generated chord.
List<String> generateChordFromRoot(String rootNote, ChordType chordType) {
  final int rootNoteIndex = chromaticScaleSharps.indexOf(rootNote);
  if (rootNoteIndex == -1) {
    return [];
  }

  final List<int>? pattern = chordPatterns[chordType];
  if (pattern == null) {
    return [];
  }

  final List<String> chordNotes = pattern.map((interval) {
    final noteIndex = (rootNoteIndex + interval) % 12;
    return chromaticScaleSharps[noteIndex];
  }).toList();

  return chordNotes;
}
