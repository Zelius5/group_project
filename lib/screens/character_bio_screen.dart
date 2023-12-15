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

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _futureCharacters = readJsonData();
  }

  void navigateExtraScreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterExtrasScreen();
    }));
  }
  void navigateSpellsScreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterSpellsScreen();
    }));
  }
  void navigateOverviewScreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterOverviewScreen();
    }));
  }
  void navigateStatsScreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterStatsScreen();
    }));
  }

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
                          controller: TextEditingController(text: selectedCharacter.personalityTraits ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Personality',
                            border: OutlineInputBorder(),
                          ), 
                          style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.ideals ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Ideals',
                            border: OutlineInputBorder(),
                          ), 
                          style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      SizedBox(width: 50),
                    ]
                  ),
                  SizedBox(height: 20),
                  Row(//#1
                    children: [
                      SizedBox(width: 50),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.bonds ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Bonds',
                            border: OutlineInputBorder(),
                          ), 
                          style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.flaws ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Flaws',
                            border: OutlineInputBorder(),
                          ), 
                          style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      SizedBox(width: 50),
                    ]
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                    SizedBox(width: 50),
                    Expanded(
                      child: TextField(
                        minLines: 1,
                        maxLines: 10,
                        readOnly: false,
                        controller: TextEditingController(text: selectedCharacter.inventory ?? ''),
                        decoration: InputDecoration(
                          labelText: 'Inventory',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(fontSize: dynamicFontSizeText)
                      ),
                      ),
                      SizedBox(width: 50),
                    ],
                  ),
                  
                ],
              )
            );
          }else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}", style: TextStyle(fontSize: dynamicFontSizeText)));
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
              navigateOverviewScreen(context);
              break;
            case 1:
              navigateStatsScreen(context);
              break;
            case 2:
              navigateExtraScreen(context);
              break;
            case 3:
              navigateSpellsScreen(context);
              break;
            case 4:
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