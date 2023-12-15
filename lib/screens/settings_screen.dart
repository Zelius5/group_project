import 'package:flutter/material.dart';

// Variables for changing accessibility settings
bool isSwitched = false;
double dynamicFontSizeText = 14;
double dynamicFontSizeHeader = 20;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
    _SettingsScreenState createState() => _SettingsScreenState();
  }

class _SettingsScreenState extends State<SettingsScreen> {

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Change between light mode and dark mode depending on if the switch is on
      theme: isSwitched ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(appBar: AppBar(
        // Link to the previous page
        leading: InkWell(onTap: (){ Navigator.pop(context);},
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Accessibility Settings',
              style: TextStyle(
                fontSize: dynamicFontSizeHeader,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Display Settings',
              style: TextStyle(
                fontSize: dynamicFontSizeHeader,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Switch for the light mode/dark mode
            Text('Light/Dark mode: ', style: TextStyle( fontSize: dynamicFontSizeText)),
            Switch(
              value: isSwitched, 
              onChanged: (value) {
                setState((){isSwitched = value;});
              }
            ),
            const SizedBox(height: 20),
             Text(
              'Font Settings',
              style: TextStyle(
                fontSize: dynamicFontSizeText,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Button to set the global font size to small
              ElevatedButton(
              onPressed: () {
                setState((){
                  dynamicFontSizeText = 10;
                  dynamicFontSizeHeader = 16;});
              },
              child: Text('Small', style: TextStyle(fontWeight: FontWeight.bold, fontSize: dynamicFontSizeText)),
            ),
            const SizedBox(height: 20), // Adjust as needed for spacing
            // Button to set the global font size to normal
            ElevatedButton(
              onPressed: () {
                setState((){
                  dynamicFontSizeText = 14;
                  dynamicFontSizeHeader = 20;});
              },
              child: Text('Normal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: dynamicFontSizeText)),
            ),
            const SizedBox(height: 20), // Adjust as needed for spacing
            // Button to set the global font size to large
            ElevatedButton(
              onPressed: () {
                setState((){
                  dynamicFontSizeText = 18;
                  dynamicFontSizeHeader = 24;});
              },
              child: Text('Large', style: TextStyle(fontWeight: FontWeight.bold, fontSize: dynamicFontSizeText)),
            ),
          ],
        ),
      ),
      )
    );
  }

}
