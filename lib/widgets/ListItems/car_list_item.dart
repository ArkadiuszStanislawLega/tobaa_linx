import 'package:flutter/cupertino.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/widgets/Templates/property_template.dart';

class CarListItem extends StatelessWidget {
  final Car _car;
  final int _index;

  CarListItem(this._car, this._index);

  @override
  Widget build(BuildContext context) {
    String baa = "";
    Map<BattleAirAssetType, int> container = {};
    this._car.stacks.forEach((stack) {
      stack.levels.forEach((level) {
        level.boxes.forEach((box) {
          var value = 0;
          if (container.containsKey(box.battleAirAsset.type))
            value = container[box.battleAirAsset.type]!;
          container[box.battleAirAsset.type] = value + box.capacities.current;
        });
      });
    });

    container.forEach((key, value) {
      var ba = DatabaseAssets.container[key]!;
      baa += "${ba.name}: $value szt., ";
    });

    return Container(
      color: Color(AppColors.CAR),
      child: Column(
        children: [
          PropertyTemplate('Pojazd numer:', '${this._index + 1}'),
          PropertyTemplate('Ilość środków:', '${this._car.capacity()}'),
          Text('$baa')
        ],
      ),
    );
  }
}
