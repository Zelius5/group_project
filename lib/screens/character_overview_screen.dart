import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                      SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.name ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 20), // Adjust the width between items as needed
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.level != null ? selectedCharacter.level.toString() : ''),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            labelText: 'Level',
                            border: OutlineInputBorder(),),
                        ),
                      ),
                      SizedBox(width: 50),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows 
                  Row(//#2
                    children: [
                      SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.exp ?? ''),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            labelText: 'EXP',
                            border: OutlineInputBorder(),),
                        ),
                      ),
                      SizedBox(width: 50),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows
                  Row(//#3
                    children: [
                      SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.hpMax != null ? selectedCharacter.hpMax.toString() : ''),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            labelText: 'Max HP',
                            border: OutlineInputBorder(),),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.currentHP != null ? selectedCharacter.currentHP.toString() : ''),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            labelText: 'Current HP',
                            border: OutlineInputBorder(),),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.temporaryHP != null ? selectedCharacter.temporaryHP.toString() : ''),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            labelText: 'Temporary HP',
                            border: OutlineInputBorder(),),
                        ),
                      ),
                       SizedBox(width: 50),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows
                  Row(//#4
                    children: [
                      SizedBox(width: 100),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.hitDice != null ? selectedCharacter.hitDice.toString() : ''),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            labelText: 'Hit Dice Remaining',
                            border: OutlineInputBorder(),),
                        ),
                      ),
                      SizedBox(width: 100),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows
                  Row(//#5
                    children: [
                      SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.characterClass ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Class',
                            border: OutlineInputBorder(),),
                        ),
                      ),
                      SizedBox(width: 50),
                    ],
                  ),
                  
                  SizedBox(height: 10), // Add space between rows
                  Row(//#6
                    children: [
                      SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.race ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Race',
                            border: OutlineInputBorder(),),
                        ),
                      ),
                      SizedBox(width: 50),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows
                  Row(//#7
                    children: [
                      SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.background ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Background',
                            border: OutlineInputBorder(),),
                        ),
                      ),
                      SizedBox(width: 50),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows
                  Row(//#8
                    children: [
                      SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.alignment ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Alignment',
                            border: OutlineInputBorder(),),
                        ),
                      ),
                      SizedBox(width: 50),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between rows
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
