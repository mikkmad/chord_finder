import 'package:chord_finder/data/constants/music_constants.dart';
import 'package:chord_finder/data/models/scales.dart';
import 'package:chord_finder/ui/constants/constants.dart';
import 'package:chord_finder/ui/widgets/segment_button.dart';
import 'package:flutter/material.dart';

class ScalesView extends StatefulWidget {
  const ScalesView({super.key});

  @override
  State<ScalesView> createState() => _ScalesViewState();
}

class _ScalesViewState extends State<ScalesView>
    with AutomaticKeepAliveClientMixin {
  String _selectedRootNote = chromaticScaleSharps[0];
  ScaleType _selectedScaleType = ScaleType.values[0];
  List<String> _scaleNotes = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _generateScale();
  }

  void _generateScale() {
    setState(() {
      _scaleNotes = generateScaleFromRoot(
        _selectedRootNote,
        _selectedScaleType,
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
                _generateScale();
              });
            },
          ),
          const Text(
            'Select a Scale Type:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          DropdownMenu<ScaleType>(
            initialSelection: _selectedScaleType,
            label: const Text('Scale Type'),
            enableFilter: true,
            enableSearch: true,
            filterCallback: (entries, filter) {
              if (filter.isEmpty) return entries;
              return entries.where((entry) {
                return entry.label.toLowerCase().contains(filter.toLowerCase());
              }).toList();
            },
            dropdownMenuEntries: ScaleType.values.map((scaleType) {
              return DropdownMenuEntry(
                value: scaleType,
                label: scaleType.displayName,
              );
            }).toList(),
            onSelected: (ScaleType? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedScaleType = newValue;
                  _generateScale();
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
                    '$_selectedRootNote ${_selectedScaleType.displayName}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_scaleNotes.join(' - ')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
