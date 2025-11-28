import 'package:chord_finder/data/constants/music_constants.dart';
import 'package:chord_finder/data/models/chords.dart';
import 'package:chord_finder/ui/constants/constants.dart';
import 'package:chord_finder/ui/widgets/segment_button.dart';
import 'package:flutter/material.dart';

class ChordsView extends StatefulWidget {
  const ChordsView({super.key});

  @override
  State<ChordsView> createState() => _ChordsViewState();
}

class _ChordsViewState extends State<ChordsView>
    with AutomaticKeepAliveClientMixin {
  String _selectedRootNote = chromaticScaleSharps[0];
  ChordType _selectedChordType = ChordType.values[0];
  List<String> _chordNotes = [];

  // keep the widget alive, to preserve state across view switching
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _generateChord();
  }

  void _generateChord() {
    setState(() {
      _chordNotes = generateChordFromRoot(
        _selectedRootNote,
        _selectedChordType,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: kSpacingMedium,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Select a Root Note:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          CustomSegmentedButton(
            segments: chromaticScaleSharps,
            onSelectionChanged: (value) {
              setState(() {
                _selectedRootNote = value;
                _generateChord();
              });
            },
          ),
          const Text(
            'Select a Chord Type:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          DropdownMenu<ChordType>(
            initialSelection: _selectedChordType,
            label: const Text('Chord Type'),
            enableFilter: true,
            enableSearch: true,
            filterCallback: (entries, filter) {
              if (filter.isEmpty) return entries;
              return entries.where((entry) {
                return entry.label.toLowerCase().contains(filter.toLowerCase());
              }).toList();
            },
            dropdownMenuEntries: ChordType.values.map((chordType) {
              return DropdownMenuEntry(
                value: chordType,
                label: chordType.displayName,
              );
            }).toList(),
            onSelected: (ChordType? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedChordType = newValue;
                  _generateChord();
                });
              }
            },
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$_selectedRootNote ${_selectedChordType.displayName}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_chordNotes.join(' - ')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
