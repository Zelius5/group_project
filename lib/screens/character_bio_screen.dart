import 'package:flutter/material.dart';
import 'package:project3/ProductDataModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'character_overview_screen.dart';
import 'settings_screen.dart';
import 'character_extras_screen.dart';
import 'character_spells_screen.dart';
import 'character_stats_screen.dart';


class CharacterBioScreen extends StatefulWidget {

  final int? characterId;

  const CharacterBioScreen({Key? key, this.characterId}) : super(key: key);

  @override
  _CharacterBioScreenState createState() => _CharacterBioScreenState();
}

class _CharacterBioScreenState extends State<CharacterBioScreen> {
  late Future<List<ProductDataModel>> _futureCharacters;

  // ignore: unused_field
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _futureCharacters = readJsonData();
  }
  //in the following lines, it is used to navigate through the navbar
  void navigateExtraScreen(BuildContext ctx, int? id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterExtrasScreen(characterId: id);
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
  void navigateStatsScreen(BuildContext ctx, int? id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterStatsScreen(characterId: id);
    }));
  }
  //Here we read the data from the json data
  Future<List<ProductDataModel>> readJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: const Text('Character Biography'),
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
            //here we create our rows and columns in order to display our fields
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  //in the following lines we create rows with fields where we can display the information from the correct character
                  Row(//#1
                    children: [
                      const SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.personalityTraits ?? ''),
                          decoration: const InputDecoration(
                            labelText: 'Personality',
                            border: OutlineInputBorder(),
                          ), 
                          style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.ideals ?? ''),
                          decoration: const InputDecoration(
                            labelText: 'Ideals',
                            border: OutlineInputBorder(),
                          ), 
                          style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      const SizedBox(width: 50),
                    ]
                  ),
                  const SizedBox(height: 20),
                  Row(//#1
                    children: [
                      const SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.bonds ?? ''),
                          decoration: const InputDecoration(
                            labelText: 'Bonds',
                            border: OutlineInputBorder(),
                          ), 
                          style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.flaws ?? ''),
                          decoration: const InputDecoration(
                            labelText: 'Flaws',
                            border: OutlineInputBorder(),
                          ), 
                          style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      const SizedBox(width: 50),
                    ]
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                    const SizedBox(width: 50),
                    Expanded(
                      child: TextField(
                        minLines: 1,
                        maxLines: 15,
                        readOnly: false,
                        controller: TextEditingController(text: selectedCharacter.inventory ?? ''),
                        decoration: const InputDecoration(
                          labelText: 'Inventory',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(fontSize: dynamicFontSizeText)
                      ),
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                  
                ],
              )
            );
          }else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}", style: TextStyle(fontSize: dynamicFontSizeText)));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      //creation of the navbar 
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex = 4,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: const Color.fromARGB(255, 8, 0, 2),
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
              navigateStatsScreen(context, widget.characterId);
              break;
            case 2:
              navigateExtraScreen(context, widget.characterId);
              break;
            case 3:
              navigateSpellsScreen(context, widget.characterId);
              break;
            case 4:
              break;
          }
        },
        //set up of the bottons and icons for the navbar
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