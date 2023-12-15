import 'package:flutter/material.dart';
import 'package:project3/ProductDataModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class CharacterStatsScreen extends StatefulWidget {
  const CharacterStatsScreen({Key? key}) : super(key: key);

  @override
  _CharacterStatsScreenState createState() => _CharacterStatsScreenState();
}

class _CharacterStatsScreenState extends State<CharacterStatsScreen> {
  late Future<List<ProductDataModel>> _futureCharacters;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}