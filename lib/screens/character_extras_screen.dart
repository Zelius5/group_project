import 'package:flutter/material.dart';
import 'package:project3/ProductDataModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class CharacterExtrasScreen extends StatefulWidget {
  const CharacterExtrasScreen({Key? key}) : super(key: key);

  @override
  _CharacterExtrasScreenState createState() => _CharacterExtrasScreenState();
}

class _CharacterExtrasScreenState extends State<CharacterExtrasScreen> {
  late Future<List<ProductDataModel>> _futureCharacters;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}