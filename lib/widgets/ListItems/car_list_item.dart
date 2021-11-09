import 'package:flutter/cupertino.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/widgets/Templates/property_template.dart';

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

    return Column(
      children: [
        PropertyTemplate(
          name: 'Pojazd numer:',
          value: '${this._index + 1}',
        ),
        PropertyTemplate(
          name: 'Ilość środków:',
          value: '${this._car.capacity()}',
        ),
        Text('$baa')
      ],
    );
  }
}
