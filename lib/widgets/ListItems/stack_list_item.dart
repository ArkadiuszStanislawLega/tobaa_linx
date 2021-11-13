import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/constans/app_strings.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;

import '../../main.dart';

class StackListItem extends StatelessWidget {
  final ContainerStack.Stack _stack;
  final int _index;

  StackListItem(this._stack, this._index);

  @override
  Widget build(BuildContext context) {
    String baa = "";
    Map<BattleAirAssetType, int> container = {};
    this._stack.levels.forEach((level) {
      level.boxes.forEach((box) {
        var value = 0;
        if (container.containsKey(box.battleAirAsset.type))
          value = container[box.battleAirAsset.type]!;
        container[box.battleAirAsset.type] = value + box.capacities.current;
      });
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
                  Strings.STACK,
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

    // return Column(
    //   children: [
    //     Text(
    //       '${Strings.STACK} ${this._index + 1}: ',
    //       style: TextStyle(
    //         fontWeight: FontWeight.w600,
    //       ),
    //     ),
    //     Text(
    //         '${Strings.NEW} ${massConverter(this._stack.weights.netExplosive)}'),
    //     Text(
    //         '${Strings.NET_WEIGHT} ${massConverter(this._stack.weights.net)}'),
    //     Text(
    //         '${Strings.GROSS_WEIGHT} ${massConverter(this._stack.weights.gross)}'),
    //     Text(
    //         '${Strings.NUMBER_OF_THE_CONTAINERS} ${this._stack.currentNumberOfBoxes}'),
    //     Text(
    //         '${Strings.NUMBER_OF_THE_BAA} ${this._stack.battleAirAssetCapacities.current}'),
    //     Text('$baa')
    //   ],
    // );
  }
}
