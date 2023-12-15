import 'package:flutter/material.dart';
import 'package:project3/ProductDataModel.dart';
import 'character_overview_screen.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late Future<List<ProductDataModel>> _futureCharacters;

  @override
  void initState() {
    super.initState();
    _futureCharacters = readJsonData();
  }

  void navigateCharacterOverviewScreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterOverviewScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
      ),
      body: FutureBuilder<List<ProductDataModel>>(
        future: _futureCharacters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            var items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(items[index].imageURL ?? ''),
                    ),
                    title: Text(items[index].playerName ?? ''),
                    subtitle: Text('Class: ${items[index].characterClass ?? ''}, Level: ${items[index].level ?? ''}',),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Character Details'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // TODO - Move to character_overview.dart
                                  Text('Name: ${items[index].name ?? ''}'),
                                  Text('Background: ${items[index].background ?? ''}'),
                                  Text('Race: ${items[index].race ?? ''}'),
                                  Text('Alignment: ${items[index].alignment ?? ''}'),
                                  Text('Exp: ${items[index].exp ?? ''}'),
                                  Text('Ac: ${items[index].ac ?? ''}'),
                                  Text('Initiative: ${items[index].initiative ?? ''}'),
                                  Text('Speed: ${items[index].speed ?? ''}'),
                                  Text('Max Hit Points: ${items[index].hpMax ?? ''}'),
                                  Text('Current HP: ${items[index].currentHP ?? ''}'),
                                  Text('Temporary HP: ${items[index].temporaryHP ?? ''}'),
                                  Text('Hit Dice: ${items[index].hitDice ?? ''}'),
                                  // TODO - Move to character_bio.dart
                                  Text('Inventory: ${items[index].inventory ?? ''}'),
                                  Text('Personality Traits: ${items[index].personalityTraits ?? ''}'),
                                  Text('Ideals: ${items[index].ideals ?? ''}'),
                                  Text('Bonds: ${items[index].bonds ?? ''}'),
                                  Text('Flaws: ${items[index].flaws ?? ''}'),
                                  // TODO - Move to character_stats.dart
                                  Text('Strength: ${items[index].strength ?? ''}'),
                                  Text('Dexterity: ${items[index].dexterity ?? ''}'),
                                  Text('Constitution: ${items[index].constitution ?? ''}'),
                                  Text('Intelligence: ${items[index].intelligence ?? ''}'),
                                  Text('Wisdom: ${items[index].wisdom ?? ''}'),
                                  Text('Charisma: ${items[index].charisma ?? ''}'),
                                  Text('Saving Throw Strength: ${items[index].stStrength ?? ''}'),
                                  Text('Saving Throw Dexterity: ${items[index].stDexterity ?? ''}'),
                                  Text('Saving Throw Constitution: ${items[index].stConstitution ?? ''}'),
                                  Text('Saving Throw Intelligence: ${items[index].stIntelligence ?? ''}'),
                                  Text('Saving Throw Wisdom: ${items[index].stWisdom ?? ''}'),
                                  Text('Saving Throw Charisma: ${items[index].stCharisma ?? ''}'),
                                  Text('Skill Acrobatics: ${items[index].acrobatics ?? ''}'),
                                  Text('Skill Animal Handling: ${items[index].animalHand ?? ''}'),
                                  Text('Skill Athletics: ${items[index].athletics ?? ''}'),
                                  Text('Skill Deception: ${items[index].deception ?? ''}'),
                                  Text('Skill History: ${items[index].history ?? ''}'),
                                  Text('Skill Insight: ${items[index].insight ?? ''}'),
                                  Text('Skill Intimidation: ${items[index].intimidation ?? ''}'),
                                  Text('Skill Investigation: ${items[index].investigation ?? ''}'),
                                  Text('Skill Medicine: ${items[index].medicine ?? ''}'),
                                  Text('Skill Nature: ${items[index].nature ?? ''}'),
                                  Text('Skill Perception: ${items[index].perception ?? ''}'),
                                  Text('Skill Performance: ${items[index].performance ?? ''}'),
                                  Text('Skill Persuasion: ${items[index].persuasion ?? ''}'),
                                  Text('Skill Religion: ${items[index].religion ?? ''}'),
                                  Text('Skill Sleight Of Hand: ${items[index].sleightHand ?? ''}'),
                                  Text('Skill Stealth: ${items[index].stealth ?? ''}'),
                                  Text('Skill Survival: ${items[index].survival ?? ''}'),
                                  // TODO - Move to character_extras.dart
                                  Text('Character Appearance: ${items[index].characterAppearance ?? ''}'),
                                  Text('Allies And Organization: ${items[index].alliesAndOrg ?? ''}'),
                                  Text('Backstory: ${items[index].backstory ?? ''}'),
                                  Text('Features Or Traits: ${items[index].featuresOrTraits ?? ''}'),
                                  Text('Treasure: ${items[index].treasure ?? ''}'),
                                  
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
    );
  }

  Future<List<ProductDataModel>> readJsonData() async {
    try {
      final jsondata = await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
      final list = json.decode(jsondata) as List<dynamic>;

      return list.map((e) => ProductDataModel.fromJson(e)).toList();
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
