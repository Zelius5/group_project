import 'package:flutter/material.dart';
import 'package:project3/ProductDataModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class CharacterOverviewScreen extends StatefulWidget {
  final int? characterId;

  CharacterOverviewScreen({Key? key, this.characterId}) : super(key: key);

  @override
  _CharacterOverviewScreenState createState() => _CharacterOverviewScreenState();
}

class _CharacterOverviewScreenState extends State<CharacterOverviewScreen> {
  late Future<List<ProductDataModel>> _futureCharacters;

  @override
  void initState() {
    super.initState();
    _futureCharacters = readJsonData();
  }

  Future<List<ProductDataModel>> readJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character Overview'),
      ),
      body: FutureBuilder<List<ProductDataModel>>(
        future: _futureCharacters,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var items = snapshot.data!;
            var selectedCharacter = items.firstWhere(
              (character) => character.id == widget.characterId,
              orElse: () => ProductDataModel(), 
            );

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${selectedCharacter.name ?? ''}'),
                  Text('Class: ${selectedCharacter.characterClass ?? ''}'),
                  Text('Level: ${selectedCharacter.level ?? ''}'),
                  Text('Background: ${selectedCharacter.background ?? ''}'),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
