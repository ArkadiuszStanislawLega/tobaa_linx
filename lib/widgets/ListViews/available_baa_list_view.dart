import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/constans/app_urls.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/database/db_assets.dart';

import '../../main.dart';
import '../ListItems/baa_list_item.dart';

class AvailableBaaListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AvailableBaaListViewState();
  }
}

class _AvailableBaaListViewState extends State<AvailableBaaListView> {
  _AvailableBaaListViewState();

  @override
  Widget build(BuildContext context) {
    Iterable<BattleAirAsset> assets = DatabaseAssets.container.values;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: assets.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
            onTap: (){
              TOBAAApp.index = assets.elementAt(index).type;
              Navigator.pushNamed(context, Url.DETAIL);
            },
            title: BaaListItem(assets.elementAt(index))
          ),
        );
      },
    );
  }
}