import 'package:flutter/material.dart';

class CustomSegmentedButton extends StatefulWidget {
  final List<String> segments;
  final Function(String)? onSelectionChanged;

  const CustomSegmentedButton({
    super.key,
    required this.segments,
    this.onSelectionChanged,
  });

  @override
  State<CustomSegmentedButton> createState() => _CustomSegmentedButtonState();
}

class _CustomSegmentedButtonState extends State<CustomSegmentedButton> {
  String? _selectedSegment;

  @override
  void initState() {
    super.initState();
    if (widget.segments.isNotEmpty) {
      _selectedSegment = widget.segments.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.segments.isEmpty) {
      return const SizedBox.shrink();
    }

    return SegmentedButton<String>(
      showSelectedIcon: false,
      segments: widget.segments.map((segmentValue) {
        return ButtonSegment<String>(
          value: segmentValue,
          label: Text(segmentValue),
        );
      }).toList(),
      selected: _selectedSegment != null ? {_selectedSegment!} : <String>{},
      onSelectionChanged: (Set<String> newSelection) {
        if (newSelection.isNotEmpty) {
          setState(() {
            _selectedSegment = newSelection.first;
            widget.onSelectionChanged?.call(_selectedSegment!);
          });
        }
      },
    );
  }
}
