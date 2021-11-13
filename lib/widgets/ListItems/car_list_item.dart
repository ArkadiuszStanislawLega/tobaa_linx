import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/constans/app_strings.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/enumerators/baa_type.dart';

class CarListItem extends StatelessWidget {
  final Car _car;
  final int _index;

  CarListItem(this._car, this._index);

  @override
  Widget build(BuildContext context) {
    String baa = "";
    Map<BattleAirAssetType, int> container = {};
    this._car.stacks.forEach(
      (stack) {
        stack.levels.forEach(
          (level) {
            level.boxes.forEach(
              (box) {
                var value = 0;
                if (container.containsKey(box.battleAirAsset.type))
                  value = container[box.battleAirAsset.type]!;
                container[box.battleAirAsset.type] =
                    value + box.capacities.current;
              },
            );
          },
        );
      },
    );

    container.forEach(
      (key, value) {
        var ba = DatabaseAssets.container[key]!;
        baa += "${ba.name}: $value szt., ";
      },
    );

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
                  ' ${Strings.CAR_NUMBER}',
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
              padding: EdgeInsets.symmetric(vertical: 8.0),
              color: Colors.white30,
              child: Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          border: Border.all(color: Colors.deepOrangeAccent, width: 4.0),
                          borderRadius: BorderRadius.all(Radius.circular(39.0)),
                        ),

                        // padding: EdgeInsets.all(4),
                        // color: Colors.blue,
                        child: Text(
                          this._car.explosionClass.toString(),
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    ' $baa',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
