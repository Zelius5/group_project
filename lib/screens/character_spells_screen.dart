import 'package:flutter/material.dart';
import 'package:project3/ProductDataModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'character_overview_screen.dart';
import 'settings_screen.dart';
import 'character_bio_screen.dart';
import 'character_extras_screen.dart';
import 'character_stats_screen.dart';

class CharacterSpellsScreen extends StatefulWidget {

  final int? characterId;


  const CharacterSpellsScreen({Key? key, this.characterId}) : super(key: key);

  @override
  _CharacterSpellsScreenState createState() => _CharacterSpellsScreenState();
}

class _CharacterSpellsScreenState extends State<CharacterSpellsScreen> {
  late Future<List<ProductDataModel>> _futureCharacters;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _futureCharacters = readJsonData();
  }

  void navigateExtraScreen(BuildContext ctx, int id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterExtrasScreen(characterId: id);
    }));
  }
  void navigateBioScreen(BuildContext ctx, int id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterBioScreen(characterId: id);
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
        title: const Text('Spells'),
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
                  SizedBox(width:50, height: 50),
                  Expanded(child: TextField(
                          minLines: 1,
                          maxLines: 20,
                          readOnly: false,
                          //TODO - Add "Spells" to the JSON file and change this textfield to spells
                          controller: TextEditingController(text: selectedCharacter.background ?? ''),
                          decoration: InputDecoration(
                            labelText: 'Spells',
                            border: OutlineInputBorder(),
                          ), 
                          style: TextStyle(fontSize: dynamicFontSizeText)
                        ),),
                  SizedBox(height: 50, width: 50),
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
              navigateExtraScreen(context, 1);
              break;
            case 3:
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