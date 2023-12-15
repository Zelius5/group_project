import 'package:flutter/material.dart';
import 'package:project3/ProductDataModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class CharacterSpellsScreen extends StatefulWidget {
  const CharacterSpellsScreen({Key? key}) : super(key: key);

  @override
  _CharacterSpellsScreenState createState() => _CharacterSpellsScreenState();
}

class _CharacterSpellsScreenState extends State<CharacterSpellsScreen> {
  late Future<List<ProductDataModel>> _futureCharacters;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}