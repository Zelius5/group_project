import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project3/ProductDataModel.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' as rootBundle;
import 'package:project3/screens/character_bio_screen.dart';
import 'package:project3/screens/character_extras_screen.dart';
import 'package:project3/screens/character_spells_screen.dart';
import 'package:project3/screens/character_stats_screen.dart';
import '/screens/settings_screen.dart';

class CharacterOverviewScreen extends StatefulWidget {
  final int? characterId;

  CharacterOverviewScreen({Key? key, this.characterId}) : super(key: key);

  @override
  _CharacterOverviewScreenState createState() => _CharacterOverviewScreenState();
}

class _CharacterOverviewScreenState extends State<CharacterOverviewScreen> {
  late Future<List<ProductDataModel>> _futureCharacters;
  late TextEditingController nameController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _futureCharacters = readJsonData();
  }

  void navigateExtraScreen(BuildContext ctx, int? id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterExtrasScreen(characterId: id);
    }));
  }
  void navigateBioScreen(BuildContext ctx, int? id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterBioScreen(characterId: id);
    }));
  }
  void navigateSpellsScreen(BuildContext ctx, int? id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterSpellsScreen(characterId: id);
    }));
  }
  void navigateStatsScreen(BuildContext ctx, int? id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterStatsScreen(characterId: id);
    }));
  }

  void saveChanges(List<ProductDataModel> characters) {
    updateCharacterData(characters).then((_) {
      setState(() {
        // Update your UI or refresh the data after saving changes
        // This will reflect the changes made to the JSON file
      });
    });
  }
  Future<void> updateCharacterData(List<ProductDataModel> characters) async {
  final file = File('jsonfile/productlist.json');

  // Convert characters to JSON
  List<Map<String, dynamic>> jsonList = characters.map((character) => character.toJson()).toList();

  // Write the JSON data to the file
  await file.writeAsString(json.encode(jsonList));
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
        title: const Text('Character Overview'),
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
                  const SizedBox(height: 10),
                  Row(//#1
                    children: [
                      const SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              selectedCharacter.name = value;
                              
                            });
                          },
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.name ?? ''),
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                          
                          onEditingComplete: () {
                            saveChanges(items); // Save changes when editing 'Name' is complete
                          }, 
                          style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      const SizedBox(width: 20), // Adjust the width between items as needed
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.level != null ? selectedCharacter.level.toString() : ''),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Level',
                            border: OutlineInputBorder(),), 
                            style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                  const SizedBox(height: 10), // Add space between rows 
                  Row(//#2
                    children: [
                      const SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.exp ?? ''),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            labelText: 'EXP',
                            border: OutlineInputBorder(),),
                            style: TextStyle(fontSize: dynamicFontSizeText)),
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                  const SizedBox(height: 10), // Add space between rows
                  Row(//#3
                    children: [
                      const SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.hpMax != null ? selectedCharacter.hpMax.toString() : ''),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Max HP',
                            border: OutlineInputBorder(),), 
                            style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.currentHP != null ? selectedCharacter.currentHP.toString() : ''),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Current HP',
                            border: OutlineInputBorder(),), 
                            style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.temporaryHP != null ? selectedCharacter.temporaryHP.toString() : ''),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Temporary HP',
                            border: OutlineInputBorder(),),
                             style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                       const SizedBox(width: 50),
                    ],
                  ),
                  const SizedBox(height: 10), // Add space between rows
                  Row(//#4
                    children: [
                      const SizedBox(width: 100),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.hitDice != null ? selectedCharacter.hitDice.toString() : ''),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Hit Dice Remaining',
                            border: OutlineInputBorder(),), 
                            style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      const SizedBox(width: 100),
                    ],
                  ),
                  const SizedBox(height: 10), // Add space between rows
                  Row(//#5
                    children: [
                      const SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.characterClass ?? ''),
                          decoration: const InputDecoration(
                            labelText: 'Class',
                            border: OutlineInputBorder(),), 
                            style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                  
                  const SizedBox(height: 10), // Add space between rows
                  Row(//#6
                    children: [
                      const SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.race ?? ''),
                          decoration: const InputDecoration(
                            labelText: 'Race',
                            border: OutlineInputBorder(),),
                            style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                  const SizedBox(height: 10), // Add space between rows
                  Row(//#7
                    children: [
                      const SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.background ?? ''),
                          decoration: const InputDecoration(
                            labelText: 'Background',
                            border: OutlineInputBorder(),), 
                            style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                     const SizedBox(width: 50),
                    ],
                  ),
                  const SizedBox(height: 10), // Add space between rows
                  Row(//#8
                    children: [
                      const SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.alignment ?? ''),
                          decoration: const InputDecoration(
                            labelText: 'Alignment',
                            border: OutlineInputBorder(),), 
                            style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      const SizedBox(width: 50),
                    ],

                  ),
                  
                  const SizedBox(height: 10), // Add space between rows
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}", style: TextStyle(fontSize: dynamicFontSizeText)));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
        bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor:const  Color.fromARGB(255, 8, 0, 2),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          // Handle navigation to different screens based on the index
          switch (index) {
            case 0:
              break;
            case 1:
              navigateStatsScreen(context, widget.characterId);
              break;
            case 2:
              navigateExtraScreen(context, widget.characterId);
              break;
            case 3:
              navigateSpellsScreen(context, widget.characterId);
              break;
            case 4:
              navigateBioScreen(context, widget.characterId);
              break;
          }
        },
        
        items:const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Extras',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Spells',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Bio',
          ),
        ],
      ),
    );
  }
}
