import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';

class BaaListItem extends StatefulWidget {
  final BattleAirAsset baa;

  BaaListItem(this.baa);

  @override
  State<StatefulWidget> createState() {
    return _BaaListItemState(this.baa);
  }
}

class _BaaListItemState extends State<BaaListItem> {
  final BattleAirAsset baa;

  _BaaListItemState(this.baa);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
          children:
      [
        Text(baa.name, textAlign: TextAlign.center,),
        Text(baa.explosionClass.toString(), textAlign: TextAlign.center,)
      ]),
      //TODO: Zrobić tak żeby tu była sama liczba podanych środków.
      Text('Ilość')
    ]
    );
  }
}