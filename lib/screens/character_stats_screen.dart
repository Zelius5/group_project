import 'package:flutter/material.dart';
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

  int _currentIndex = 0;

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
  void navigateExtraScreen(BuildContext ctx, int id) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterExtrasScreen(characterId: id);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: const Text('Character Stats'),
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
              break;
            case 2:
              navigateExtraScreen(context, 1);
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