import 'package:flutter/widgets.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/widgets/Constants/strings.dart';

import '../../main.dart';

Widget boxListItem(Box box) {
  return
    Container(
      color: Color(AppColors.BOX),
      child: Column(
        children: [
          Text('${box.name}', style: TextStyle(fontWeight: FontWeight.w600,)),
          Text('${Strings.NEW} ${massConverter(box.weights.netExplosive)}'),
          Text('${Strings.NET_WEIGHT} ${massConverter(box.weights.net)}'),
          Text('${Strings.GROSS_WEIGHT} ${massConverter(box.weights.gross)}'),
          Text('${Strings.NUMBER_OF_THE_BAA} ${box.capacities.current}'),
        ],
      ),
    );
}