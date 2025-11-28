import 'package:chord_finder/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class AppNavigationRail extends StatefulWidget {
  final Function(String, IconData, IconData, bool) onTitleChanged;

  const AppNavigationRail({super.key, required this.onTitleChanged});

  @override
  State<AppNavigationRail> createState() => _AppNavigationRailState();
}

class _AppNavigationRailState extends State<AppNavigationRail> {
  int _selectedIndex = 0;

  final List<
    ({String title, IconData icon, IconData selectedIcon, bool disabled})
  >
  _viewData = [
    (
      disabled: false,
      icon: Icons.queue_music_outlined,
      selectedIcon: Icons.queue_music,
      title: 'Scales',
    ),
    (
      disabled: false,
      icon: Icons.music_note_outlined,
      selectedIcon: Icons.music_note,
      title: 'Chords',
    ),
    (
      disabled: true,
      icon: Icons.favorite_outline,
      selectedIcon: Icons.favorite,
      title: 'Favourites',
    ),
    (
      disabled: true,
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
      title: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
              widget.onTitleChanged(
                _viewData[index].title,
                _viewData[index].icon,
                _viewData[index].selectedIcon,
                _viewData[index].disabled,
              );
            });
          },
          labelType: NavigationRailLabelType.all,
          destinations: _viewData
              .map(
                (data) => NavigationRailDestination(
                  icon: Icon(data.icon),
                  selectedIcon: Icon(data.selectedIcon),
                  label: Text(data.title),
                  disabled: data.disabled,
                ),
              )
              .toList(),
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: IndexedStack(
            index: _selectedIndex,
            children: const [
              Center(child: ScalesView()),
              Center(child: ChordsView()),
              Center(child: Text('Favourites')),
              Center(child: Text('Settings')),
            ],
          ),
        ),
      ],
    );
  }
}
