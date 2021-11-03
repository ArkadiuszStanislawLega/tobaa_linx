import 'package:flutter/widgets.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/widgets/Constants/strings.dart';

import '../../main.dart';

class BoxListItem extends StatelessWidget {
  final Box _box;
  BoxListItem(this._box);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Color(AppColors.BOX),
        child: Column(
          children: [
            Text('${this._box.name}', style: TextStyle(fontWeight: FontWeight.w600,)),
            Text('${Strings.NEW} ${massConverter(this._box.weights.netExplosive)}'),
            Text('${Strings.NET_WEIGHT} ${massConverter(this._box.weights.net)}'),
            Text('${Strings.GROSS_WEIGHT} ${massConverter(this._box.weights.gross)}'),
            Text('${Strings.NUMBER_OF_THE_BAA} ${this._box.capacities.current}'),
          ],
        ),
      );
  }
}