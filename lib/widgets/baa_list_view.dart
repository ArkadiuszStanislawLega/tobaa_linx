import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/database/db_assets.dart';

import '../main.dart';

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