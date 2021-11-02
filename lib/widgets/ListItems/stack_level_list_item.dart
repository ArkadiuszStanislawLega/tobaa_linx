import 'package:flutter/widgets.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/widgets/Constants/strings.dart';

import '../../main.dart';

Widget stackLevelListItem(StackLevel level, int index) {
  String baa = "";
  Map<BattleAirAssetType, int> container = {};

  level.boxes.forEach((box) {
    var value = 0;
    if (container.containsKey(box.battleAirAsset.type))
      value = container[box.battleAirAsset.type]!;
    container[box.battleAirAsset.type] = value + box.capacities.current;
  });

  container.forEach((key, value) {
    var ba = DatabaseAssets.container[key]!;
    baa += "${ba.name}: $value szt., ";
  });
  return
    Container(
      color: Color(AppColors.STACK_LEVEL),
      child: Column(
        children: [
          Text('${Strings.STACK_LEVEL} ${index + 1}',
              style: TextStyle(fontWeight: FontWeight.w600,)
          ),
          Text('${Strings.NEW} ${massConverter(level.weights.netExplosive)}'),
          Text('${Strings.NET_WEIGHT} ${massConverter(level.weights.net)}'),
          Text('${Strings.GROSS_WEIGHT} ${massConverter(
              level.weights.gross)}'),
          Text('${Strings.NUMBER_OF_THE_CONTAINERS} ${level.boxes.length}'),
          Text('${Strings.NUMBER_OF_THE_BAA} ${level.capacities.current}'),
          Text('$baa')
        ],
      ),
    );
}