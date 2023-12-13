import 'package:flutter/material.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
    _SettingsScreenState createState() => _SettingsScreenState();
  }

class _SettingsScreenState extends State<SettingsScreen> {

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Accessibility Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Display Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Light/Dark mode: ', style: TextStyle(color: isSwitched ? Colors.white : Colors.black)),
            Switch(
              value: isSwitched, 
              onChanged: (value) {
                setState((){isSwitched = !isSwitched;});
              }
            ),
            const SizedBox(height: 20),
            const Text(
              'Font Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Font Size'),
              value: 'Normal', 
              onChanged: (value) {
                //Font size logic here
              },
              items: ['Small', 'Normal', 'Large']
                  .map((size) => DropdownMenuItem(
                        value: size,
                        child: Text(size),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Font Style'),
              value: 'Arial', 
              onChanged: (value) {
                // font style logic here
              },
              items: ['Arial', 'Times New Roman', 'Roboto']
                  .map((style) => DropdownMenuItem(
                        value: style,
                        child: Text(style),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
