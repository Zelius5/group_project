import 'package:flutter/material.dart';
import '/screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Character Sheet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Character Sheet'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  void navigateSettingsScreen(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
      return SettingsScreen();
    }));
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Center(child: Column( mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Character sheet button
      ElevatedButton(
        onPressed: () {},
        child:const Text('Character', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        // SizedBox widget to add space between buttons
        const SizedBox(height: 10),
        // Settings button
        ElevatedButton(
        onPressed: () {
          navigateSettingsScreen(context);
        },
        child:const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        )
      ],)
      ),
    );
  }
}
