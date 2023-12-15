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
                  SizedBox(height: 10),
                  Row(//#1
                    children: [
                      Expanded(
                        child: TextField(
                          
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.name ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',
                          ),
                        ),
                      ),
                      SizedBox(width: 20), // Adjust the width between items as needed
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.level != null ? selectedCharacter.level.toString() : ''),
                          decoration: InputDecoration(
                            labelText: 'Level',
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows
                  Row(//#2
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.characterClass ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Class',
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',),
                        ),
                      ),
                      SizedBox(width: 20), // Adjust the width between items as needed
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.background ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Background',
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows
                  Row(//#3
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.exp ?? ''),
                          decoration: InputDecoration(
                            labelText: 'EXP',
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows
                  Row(//#4
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.characterClass ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Class',
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows
                  Row(//#5
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.characterClass ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Class',
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows
                  Row(//#6
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.characterClass ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Class',
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows
                  Row(//#7
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.characterClass ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Class',
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows
                  Row(//#8
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.characterClass ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Class',
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows
                  Row(//#9
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.characterClass ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Class',
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',),
                        ),
                      ),
                    ],
                  ),
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
