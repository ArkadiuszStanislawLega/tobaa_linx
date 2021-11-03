import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/widgets/ListViews/boxes_list_view.dart';
import 'package:tobaa/widgets/SmallWidgets/property_view.dart';
import 'package:tobaa/widgets/SmallWidgets/property_with_hint_view.dart';

import '../../main.dart';
import '../Constants/strings.dart';

class StackLevelDetailView extends StatelessWidget {
  final StackLevel _stackLevel;

  StackLevelDetailView(this._stackLevel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: this._stackLevel.boxes.length > 0
              ? Text('Poziom stosu z ${this._stackLevel.boxes.first.name}')
              : Text(
                  '${Strings.NUMBER_OF_THE_BAA} ${this._stackLevel.capacities.current}')),
      body: Container(
          color: Color(AppColors.STACK_LEVEL),
          child: new SingleChildScrollView(
              child: Column(
            children: [
              PropertyView(Strings.WIDTH,
                  '${sizeConverter(this._stackLevel.dimensions.width)}'),
              PropertyView(Strings.LENGTH,
                  '${sizeConverter(this._stackLevel.dimensions.length)}'),
              PropertyView(Strings.HEIGHT,
                  '${sizeConverter(this._stackLevel.dimensions.height)}'),
              PropertyView(Strings.NEW,
                  '${massConverter(this._stackLevel.weights.netExplosive)}'),
              PropertyWithHint(Strings.HINT_NET_WEIGHT, Strings.NET_WEIGHT,
                  '${massConverter(this._stackLevel.weights.net)}'),
              PropertyWithHint(Strings.HINT_GROSS_WEIGHT, Strings.GROSS_WEIGHT,
                  '${massConverter(this._stackLevel.weights.gross)}'),
              PropertyView(Strings.NUMBER_OF_THE_CONTAINERS,
                  '${this._stackLevel.boxes.length}'),
              PropertyView(Strings.NUMBER_OF_THE_BAA,
                  '${this._stackLevel.capacities.current}'),
              BoxesListView(this._stackLevel.boxes)
            ],
          ))),
    );
  }
}
