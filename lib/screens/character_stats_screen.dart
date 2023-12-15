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
  final int? characterId;

  const CharacterStatsScreen({Key? key, this.characterId}) : super(key: key);

  @override
  _CharacterStatsScreenState createState() => _CharacterStatsScreenState();
}

class _CharacterStatsScreenState extends State<CharacterStatsScreen> {
  late Future<List<ProductDataModel>> _futureCharacters;

  // ignore: unused_field
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _futureCharacters = readJsonData();
  }
  //code to read json
  Future<List<ProductDataModel>> readJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
  //following lines are used to navigate between screens in the navbar
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
  
  void navigateOverviewScreen(BuildContext ctx, int? id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterOverviewScreen(characterId: id);
    }));
  }
  
  void navigateExtraScreen(BuildContext ctx,int? id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterExtrasScreen(characterId: id);
    }));
  }
  //this is where all columns and rows are set up
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
            //scrolling function in order to scroll either down or up the screen
            return SingleChildScrollView(
              child: Center(
              child: Row(
                children: [
                  Expanded(
                    //column for the main attributes
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10), // Add space between rows 
                        //following lines is where we have rows for each field and grabbing the necessary information from json
                        Row(//#1
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.strength != null ? selectedCharacter.strength.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Strength',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                          ],

                        ),
                        const SizedBox(height: 25),
                        Row(//#2
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.dexterity != null ? selectedCharacter.dexterity.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Dexterity',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                          ],

                        ),
                        const SizedBox(height: 25),
                        Row(//#3
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.constitution != null ? selectedCharacter.constitution.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Consitution',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                          ],

                        ),
                        const SizedBox(height: 25),
                        Row(//#4
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.intelligence != null ? selectedCharacter.intelligence.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Intelligence',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                          ],

                        ),
                        const SizedBox(height: 25),
                        Row(//#5
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.wisdom != null ? selectedCharacter.wisdom.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Wisdom',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                          ],

                        ),
                        const SizedBox(height: 25),
                        Row(//#6
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.charisma != null ? selectedCharacter.charisma.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Charisma',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                          ],

                        ),
                        
                      ],
                      
                    ),
                    
                  ),
                  //the other column here is for saving throws and skill checks
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        //added a container in order to display a title
                        Row(//#1
                          children: [
                            const SizedBox(width: 200),
                            Container(
                              padding: const EdgeInsets.all(8.0), // Add padding as needed
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 2.0), // Add a border
                                borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
                              ),
                              child: const Text(
                                'Saving Throws / Skill Checks',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const SizedBox(width: 50),
                          ],
                        ),
                        const SizedBox(height: 25),
                        //following lines and rows is where we display the information we grabbed from the json
                        Row(//#2
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.stStrength != null ? selectedCharacter.stStrength.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Strength',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                          Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.stConstitution != null ? selectedCharacter.stConstitution.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Constiution',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                          const SizedBox(width: 50),
                          ],
                          
                        ),
                        Row(//#3
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.athletics != null ? selectedCharacter.athletics.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Athlethics',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 355),
                          ],
                        ),
                        Row(//#4
                          children: [
                            const SizedBox(width: 355),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.stCharisma != null ? selectedCharacter.stCharisma.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Charisma',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                          ],
                        ),
                        Row(//#5
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.stDexterity != null ? selectedCharacter.stDexterity.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Dexterity',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.deception != null ? selectedCharacter.deception.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Deception',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                           const SizedBox(width: 50),
                          ],
                        ),
                        Row(//#6
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.acrobatics != null ? selectedCharacter.acrobatics.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Acrobatics',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.intimidation != null ? selectedCharacter.intimidation.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Intimidation',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                           const SizedBox(width: 50),
                          ],
                        ),
                        Row(//#7
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.sleightHand != null ? selectedCharacter.sleightHand.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Sleight of Hand',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.performance != null ? selectedCharacter.performance.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Performance',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                           const SizedBox(width: 50),
                          ],
                        ),
                        Row(//#8
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.stealth != null ? selectedCharacter.stealth.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Stealth',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                          const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.persuasion != null ? selectedCharacter.persuasion.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Persuasion',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                           const SizedBox(width: 50),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Row(//#9
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.stIntelligence != null ? selectedCharacter.stIntelligence.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Intelligence',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.stWisdom != null ? selectedCharacter.stWisdom.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Wisdom',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                           const SizedBox(width: 50),
                          ],
                        ),
                        Row(//#10
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.arcana != null ? selectedCharacter.arcana.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Arcana',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                          const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.animalHand != null ? selectedCharacter.animalHand.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Animal Handling',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                           const SizedBox(width: 50),
                          ],
                        ),
                        Row(//#11
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.investigation != null ? selectedCharacter.investigation.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Investigation',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.insight != null ? selectedCharacter.insight.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Insight',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                           const SizedBox(width: 50),
                          ],
                        ),
                        Row(//#12
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.history != null ? selectedCharacter.history.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'History',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.medicine != null ? selectedCharacter.medicine.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Medicine',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                           const SizedBox(width: 50),
                          ],
                        ),
                        Row(//#13
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.nature != null ? selectedCharacter.nature.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Nature',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.perception != null ? selectedCharacter.perception.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Perception',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                           const SizedBox(width: 50),
                          ],
                        ),
                        Row(//#14
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.religion != null ? selectedCharacter.religion.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Religion',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.left,
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.survival != null ? selectedCharacter.survival.toString() : ''),
                          decoration: const InputDecoration(
                          labelText: 'Survival',
                          border: OutlineInputBorder(),
                          ),                         
                          style: TextStyle(fontSize: dynamicFontSizeText),
                              ),
                            ),
                           const SizedBox(width: 50),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),
          );
            
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}", style: TextStyle(fontSize: dynamicFontSizeText)));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      //code in order to set up navbar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex = 1,
        
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: const Color.fromARGB(255, 8, 0, 2),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          // Handle navigation to different screens based on the index along with pushing the Id in order to pull information
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
        //This is where we have our buttons laid out with icons
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
