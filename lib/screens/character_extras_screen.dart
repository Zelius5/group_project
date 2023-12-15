import 'package:flutter/material.dart';
import 'package:project3/ProductDataModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'character_overview_screen.dart';
import 'settings_screen.dart';
import 'character_bio_screen.dart';
import 'character_spells_screen.dart';
import 'character_stats_screen.dart';


class CharacterExtrasScreen extends StatefulWidget {

  final int? characterId;

  const CharacterExtrasScreen({Key? key, this.characterId}) : super(key: key);

  @override
  _CharacterExtrasScreenState createState() => _CharacterExtrasScreenState();
}

class _CharacterExtrasScreenState extends State<CharacterExtrasScreen> {
  late Future<List<ProductDataModel>> _futureCharacters;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _futureCharacters = readJsonData();
  }

  void navigateBioScreen(BuildContext ctx, int id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterBioScreen(characterId: id);
    }));
  }
  void navigateSpellsScreen(BuildContext ctx, int id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterSpellsScreen(characterId: id);
    }));
  }
  void navigateOverviewScreen(BuildContext ctx, int id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterOverviewScreen(characterId: id);
    }));
  }
  void navigateStatsScreen(BuildContext ctx, int id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterStatsScreen(characterId: id);
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
        title: const Text('Character Extras'),
      ),body: FutureBuilder<List<ProductDataModel>>(
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
                          controller: TextEditingController(text: selectedCharacter.characterAppearance ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Appearance',
                            border: OutlineInputBorder(),
                          ), 
                          style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.alliesAndOrg ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Allies',
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
                          controller: TextEditingController(text: selectedCharacter.backstory ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Backstory',
                            border: OutlineInputBorder(),
                          ), 
                          style: TextStyle(fontSize: dynamicFontSizeText)
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          controller: TextEditingController(text: selectedCharacter.treasure ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Treasure',
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
                        maxLines: 15,
                        readOnly: false,
                        controller: TextEditingController(text: selectedCharacter.featuresOrTraits ?? ''),
                        decoration: InputDecoration(
                          labelText: 'Features/Traits',
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
              navigateOverviewScreen(context, 1);
              break;
            case 1:
              navigateStatsScreen(context, 1);
              break;
            case 2:
              break;
            case 3:
              navigateSpellsScreen(context, 1);
              break;
            case 4:
              navigateBioScreen(context, 1);
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