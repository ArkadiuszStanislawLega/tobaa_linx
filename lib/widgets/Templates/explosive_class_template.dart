import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';

import 'chip_template.dart';

class ExplosiveClassTemplate extends StatelessWidget {
  final BattleAirAsset _battleAirAsset;

  ExplosiveClassTemplate(this._battleAirAsset);

  @override
  Widget build(BuildContext context) {
    return ChipTemplate(
      label: this._battleAirAsset.explosionClass.toString(),
      backgroundColor: Colors.deepOrange,
      fontColor: Colors.white,
    );
  }
}
