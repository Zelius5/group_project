import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Accessibility Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Display Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: false, 
              onChanged: (value) {
                //TODO, put dark mode logic here
              },
            ),
            SizedBox(height: 20),
            Text(
              'Font Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Font Size'),
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
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Font Style'),
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
