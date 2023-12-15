import 'package:flutter/material.dart';
import 'package:project3/ProductDataModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class CharacterBioScreen extends StatefulWidget {
  const CharacterBioScreen({Key? key}) : super(key: key);

  @override
  _CharacterBioScreenState createState() => _CharacterBioScreenState();
}

class _CharacterBioScreenState extends State<CharacterBioScreen> {
  late Future<List<ProductDataModel>> _futureCharacters;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}