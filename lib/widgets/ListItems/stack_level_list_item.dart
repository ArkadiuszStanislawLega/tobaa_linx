import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/constants/app_strings.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/stack/stack_level.dart';

class StackLevelListItem extends StatelessWidget {
  final StackLevel _level;
  final int _index;

  StackLevelListItem(this._level, this._index);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shadowColor: Colors.teal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: Row(
          children: [this._left(), this._right()],
        ),
      ),
    );
  }

  Widget _left() {
    return Container(
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
    );
  }

  Widget _right() {
    List<Widget> widgets = [];
    Map<BattleAirAssetType, int> container = {};

    this._level.boxes.forEach((box) {
      var value = 0;
      if (container.containsKey(box.battleAirAsset.type))
        value = container[box.battleAirAsset.type]!;
      container[box.battleAirAsset.type] = value + box.capacities.current;
    });

   container.forEach((key, value) {
     widgets.add(
       Chip(
         backgroundColor: Colors.lightBlue,
         shadowColor: Colors.black,
         elevation: 4.0,
         label: Text(
           "${DatabaseAssets.container[key]!.name} - $value ${Strings.PCS}",
           style: TextStyle(
               fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold),
           textAlign: TextAlign.right,
         ),
       ),
     );
   });

    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(4.0, 7.0, 4.0, 7.0),
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(children: widgets),
      ),
    );
  }
}
