import 'package:flutter/material.dart';
import '/screens/character_overview_screen.dart';
import 'package:project3/ProductDataModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import '/screens/settings_screen.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

//here we push information to the next screen
class _CharacterScreenState extends State<CharacterScreen> {
  late Future<List<ProductDataModel>> _futureCharacters;
  void navigateOverviewScreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterOverviewScreen();
    }));
  }
  @override
  void initState() {
    super.initState();
    _futureCharacters = readJsonData();
  }
  //navigation code in order to go to overview
  void navigateCharacterOverviewScreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CharacterOverviewScreen();
    }));
  }
  //main set up the scaffold
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isSwitched ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){ Navigator.pop(context);},
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text('Characters'),
      ),

      body: FutureBuilder<List<ProductDataModel>>(
        future: _futureCharacters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}", style: TextStyle(fontSize: dynamicFontSizeText)));
          } else if (snapshot.hasData) {
            var items = snapshot.data!;
            //here we make a listview in order to list out all the characers that are in the json
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: ListTile(
                    //we use this in order to give each card an image icon
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(items[index].imageURL ?? ''),
                    ),
                    //here we give title and subtitles
                    title: Text(items[index].playerName ?? '', style: TextStyle(fontSize: dynamicFontSizeText)),
                    subtitle: Text('Class: ${items[index].characterClass ?? ''}, Level: ${items[index].level ?? ''}', style: TextStyle(fontSize: dynamicFontSizeText)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterOverviewScreen(characterId: items[index].id),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("No data available", style: TextStyle(fontSize: dynamicFontSizeText)));
          }
        },
      ),
    )
    );
  }
  //this is where we read the json data
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
