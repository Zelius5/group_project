import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget{
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Characters'),),
      body: Center(child: Column( mainAxisAlignment: MainAxisAlignment.center,
      children: []),
      ),
    );
  }
}