import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project3/ProductDataModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'character_overview_screen.dart';
import 'settings_screen.dart';
import 'character_bio_screen.dart';
import 'character_spells_screen.dart';
import 'character_extras_screen.dart';

class CharacterStatsScreen extends StatefulWidget {
  final characterId;

  const CharacterStatsScreen({Key? key, this.characterId}) : super(key: key);

  @override
  _CharacterStatsScreenState createState() => _CharacterStatsScreenState();
}

class _CharacterStatsScreenState extends State<CharacterStatsScreen> {
  late Future<List<ProductDataModel>> _futureCharacters;

  int _currentIndex = 0;
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
  
  void navigateBioScreen(BuildContext ctx, int? id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterBioScreen();
    }));
  }
  
  void navigateSpellsScreen(BuildContext ctx, int? id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterSpellsScreen();
    }));
  }
  
  void navigateOverviewScreen(BuildContext ctx, int? id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterOverviewScreen();
    }));
  }
  
  void navigateExtraScreen(BuildContext ctx,int? id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterExtrasScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Stats'),
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
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10), // Add space between rows
                        Row(//#1
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.strength != null ? selectedCharacter.strength.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Strength',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                          ],

                        ),
                        SizedBox(height: 25),
                        Row(//#2
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.dexterity != null ? selectedCharacter.dexterity.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Dexterity',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                          ],

                        ),
                        SizedBox(height: 25),
                        Row(//#3
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.constitution != null ? selectedCharacter.constitution.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Consitution',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                          ],

                        ),
                        SizedBox(height: 25),
                        Row(//#4
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.intelligence != null ? selectedCharacter.intelligence.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Intelligence',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                          ],

                        ),
                        SizedBox(height: 25),
                        Row(//#5
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.wisdom != null ? selectedCharacter.wisdom.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Wisdom',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                          ],

                        ),
                        SizedBox(height: 25),
                        Row(//#6
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.charisma != null ? selectedCharacter.charisma.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Charisma',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                          ],

                        ),
                        
                      ],
                      
                    ),
                    
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(//#1
                          children: [
                            SizedBox(width: 200),
                            Container(
                              padding: EdgeInsets.all(8.0), // Add padding as needed
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 2.0), // Add a border
                                borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
                              ),
                              child: Text(
                                'Saving Throws / Skill Checks',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            SizedBox(width: 50),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(//#2
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.stStrength != null ? selectedCharacter.stStrength.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Strength',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                          Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.stConstitution != null ? selectedCharacter.stConstitution.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Constiution',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                          SizedBox(width: 50),
                          ],
                          
                        ),
                        Row(//#3
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.athletics != null ? selectedCharacter.athletics.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Athlethics',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 355),
                          ],
                        ),
                        Row(//#4
                          children: [
                            SizedBox(width: 355),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.stCharisma != null ? selectedCharacter.stCharisma.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Charisma',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                          ],
                        ),
                        Row(//#5
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.stDexterity != null ? selectedCharacter.stDexterity.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Dexterity',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.deception != null ? selectedCharacter.deception.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Deception',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                           SizedBox(width: 50),
                          ],
                        ),
                        Row(//#6
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.acrobatics != null ? selectedCharacter.acrobatics.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Acrobatics',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.intimidation != null ? selectedCharacter.intimidation.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Intimidation',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                           SizedBox(width: 50),
                          ],
                        ),
                        Row(//#7
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.sleightHand != null ? selectedCharacter.sleightHand.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Sleight of Hand',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.performance != null ? selectedCharacter.performance.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Performance',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                           SizedBox(width: 50),
                          ],
                        ),
                        Row(//#8
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.stealth != null ? selectedCharacter.stealth.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Stealth',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                          SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.persuasion != null ? selectedCharacter.persuasion.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Persuasion',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                           SizedBox(width: 50),
                          ],
                        ),
                        SizedBox(height: 50),
                        Row(//#9
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.stIntelligence != null ? selectedCharacter.stIntelligence.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Intelligence',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.stWisdom != null ? selectedCharacter.stWisdom.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Wisdom',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                           SizedBox(width: 50),
                          ],
                        ),
                        Row(//#10
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.arcana != null ? selectedCharacter.arcana.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Arcana',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                          SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.animalHand != null ? selectedCharacter.animalHand.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Animal Handling',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                           SizedBox(width: 50),
                          ],
                        ),
                        Row(//#11
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.investigation != null ? selectedCharacter.investigation.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Investigation',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.insight != null ? selectedCharacter.insight.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Insight',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                           SizedBox(width: 50),
                          ],
                        ),
                        Row(//#11
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.history != null ? selectedCharacter.history.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'History',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.medicine != null ? selectedCharacter.medicine.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Medicine',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                           SizedBox(width: 50),
                          ],
                        ),
                        Row(//#11
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.nature != null ? selectedCharacter.nature.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Nature',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.perception != null ? selectedCharacter.perception.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Perception',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                           SizedBox(width: 50),
                          ],
                        ),
                        Row(//#11
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.religion != null ? selectedCharacter.religion.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Religion',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.survival != null ? selectedCharacter.survival.toString() : ''),
                          decoration: InputDecoration(
                          labelText: 'Survival',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: 16),
                              ),
                            ),
                           SizedBox(width: 50),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}", style: TextStyle(fontSize: 16)));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Color.fromARGB(255, 8, 0, 2),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          // Handle navigation to different screens based on the index
          switch (index) {
            case 0:
              navigateOverviewScreen(context, widget.characterId);
              break;
            case 1:
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
        items: const <BottomNavigationBarItem>[
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
