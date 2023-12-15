import 'package:flutter/material.dart';

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
      theme: isSwitched ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(appBar: AppBar(
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
            Text('Light/Dark mode: ', style: TextStyle(color: isSwitched ? Colors.white : Colors.black, fontSize: dynamicFontSizeText)),
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
            /*
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Font Size'),
              value: dynamicFontSizeText, 
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
            */
              ElevatedButton(
              onPressed: () {
                setState((){
                  dynamicFontSizeText = 10;
                  dynamicFontSizeHeader = 16;});
              },
              child: Text('Small', style: TextStyle(fontWeight: FontWeight.bold, fontSize: dynamicFontSizeText)),
            ),
            const SizedBox(height: 20), // Adjust as needed for spacing
            ElevatedButton(
              onPressed: () {
                setState((){
                  dynamicFontSizeText = 14;
                  dynamicFontSizeHeader = 20;});
              },
              child: Text('Normal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: dynamicFontSizeText)),
            ),
            const SizedBox(height: 20), // Adjust as needed for spacing
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
