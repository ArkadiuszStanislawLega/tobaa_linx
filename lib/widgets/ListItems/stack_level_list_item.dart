import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/constans/app_strings.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/stack/stack_level.dart';

import '../../main.dart';

class StackLevelListItem extends StatelessWidget{
  final StackLevel _level;
  final int _index;
  
   StackLevelListItem(this._level, this._index);

  @override
  Widget build(BuildContext context) {
    String baa = "";
    Map<BattleAirAssetType, int> container = {};

    this._level.boxes.forEach((box) {
      var value = 0;
      if (container.containsKey(box.battleAirAsset.type))
        value = container[box.battleAirAsset.type]!;
      container[box.battleAirAsset.type] = value + box.capacities.current;
    });

    container.forEach((key, value) {
      var ba = DatabaseAssets.container[key]!;
      baa += "${ba.name}: $value szt., ";
    });

    return Container(
      color: Colors.grey,
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(7),
            color: Colors.grey,
            child: Column(
              children: [
                Text(
                  Strings.STACK_LEVEL,
                  style: TextStyle(fontSize: 11, color: Colors.black45),
                ),
                Text(
                  '${this._index + 1}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              color: Colors.white30,
              child: Text('$baa', textAlign: TextAlign.center,),
            ),
          ),
        ],
      ),
    );

    // return
    //   Column(
    //     children: [
    //       Text('${Strings.STACK_LEVEL} ${this._index + 1}',
    //           style: TextStyle(fontWeight: FontWeight.w600,)
    //       ),
    //       Text('${Strings.NEW} ${massConverter(this._level.weights.netExplosive)}'),
    //       Text('${Strings.NET_WEIGHT} ${massConverter(this._level.weights.net)}'),
    //       Text('${Strings.GROSS_WEIGHT} ${massConverter(
    //           this._level.weights.gross)}'),
    //       Text('${Strings.NUMBER_OF_THE_CONTAINERS} ${this._level.boxes.length}'),
    //       Text('${Strings.NUMBER_OF_THE_BAA} ${this._level.capacities.current}'),
    //       Text('$baa')
    //     ],
    //   );

  }
}