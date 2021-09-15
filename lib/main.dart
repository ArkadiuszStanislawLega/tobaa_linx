import 'package:flutter/material.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/database/db_boxes.dart';
import 'package:tobaa/widgets/detail_baa_view.dart';
import 'enumerators/baa_type.dart';


void main() {
  runApp(TOBAAApp());
}

class TOBAAApp extends StatelessWidget {
  static BattleAirAssetType index = BattleAirAssetType.None;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transporting Organiser of Battle Air Assets',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: '/home',
      routes: {
        '/' : (context) => BaaList(),
        '/home': (context) => BaaList(),
        '/detail' : (context) => DetailBaa(DatabaseAssets.container[index]!)
      },
    );
  }
}

class BaaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Iterable<BattleAirAsset> assets =  DatabaseAssets.container.values;

    return Scaffold(
        appBar: AppBar(
            title: Text("Transporting Organiser of Battle Air Assets Lista")),
        body: ContentBaaList()
        );
  }
}

class ContentBaaList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContentBaaListState();
  }
}

class _ContentBaaListState extends State<ContentBaaList> {
  @override
  Widget build(BuildContext context) {
    Iterable<BattleAirAsset> assets = DatabaseAssets.container.values;
    var listItem = new ListView.builder(
        itemCount: assets.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                TOBAAApp.index = assets.elementAt(index).type;
                Navigator.pushNamed(context, '/detail');
              },
              title: Text(assets.elementAt(index).name),
            ),
          );
        },
    );

    return listItem;
  }
}



