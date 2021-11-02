import 'package:flutter/widgets.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/widgets/Constants/strings.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;

import '../../main.dart';

Widget stackItemView(ContainerStack.Stack stack, int index) {
  String baa = "";
  Map<BattleAirAssetType, int> container = {};

  stack.levels.forEach((level) {
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
    color: Color(AppColors.STACK),
    child: Column(
      children: [
        Text('${Strings.STACK} ${index + 1}: ',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text('${Strings.NEW} ${massConverter(stack.weights.netExplosive)}'),
        Text('${Strings.NET_WEIGHT} ${massConverter(stack.weights.net)}'),
        Text('${Strings.GROSS_WEIGHT} ${massConverter(stack.weights.gross)}'),
        Text(
            '${Strings.NUMBER_OF_THE_CONTAINERS} ${stack.currentNumberOfBoxes}'),
        Text(
            '${Strings.NUMBER_OF_THE_BAA} ${stack.battleAirAssetCapacities.current}'),
        Text('$baa')
      ],
    ),
  );
}