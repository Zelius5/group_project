import 'package:flutter/material.dart';
import '/screens/character_overview.dart';
import 'package:project3/ProductDataModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

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
