import 'package:flutter/material.dart';
import '/screens/settings_screen.dart';
import '/screens/character_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Character Sheet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Character Sheet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  bool isSwitched = false;

  void navigateSettingsScreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return SettingsScreen();
    }));
  }
  void navigateCharacterScreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Character sheet button
          ElevatedButton(
            onPressed: () {
                navigateCharacterScreen(context);
            },
            child: const Text('Character', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10), // SizedBox widget to add space between buttons
          // Settings button
          ElevatedButton(
            onPressed: () {
              navigateSettingsScreen(context);
            },
            child: const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 20), // Adjust as needed for spacing
        ],
        ),
      ),
    );
  }
}
