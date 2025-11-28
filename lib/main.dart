import 'package:chord_finder/ui/widgets/navigation_rail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blue)),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: true,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentTitle = 'Scales';
  IconData _currentIcon = Icons.queue_music;

  void _updateTitle(
    String newTitle,
    IconData newIcon,
    IconData selectedIcon,
    bool disabled,
  ) {
    setState(() {
      _currentTitle = newTitle;
      _currentIcon = selectedIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(_currentIcon),
        title: Text(_currentTitle, style: const TextStyle(fontWeight: .bold)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: AppNavigationRail(onTitleChanged: _updateTitle),
    );
  }
}
