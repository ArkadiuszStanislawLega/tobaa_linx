import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';

import 'chip_template.dart';

class AssetNameTemplate extends StatelessWidget{
  final BattleAirAsset _battleAirAsset;

  AssetNameTemplate(this._battleAirAsset);

  @override
  Widget build(BuildContext context) {
    return     ChipTemplate(
      label: this._battleAirAsset.name,
      backgroundColor: Colors.lightBlue,
      fontColor: Colors.white,
    );
  }

}