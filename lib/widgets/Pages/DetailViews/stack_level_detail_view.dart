import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/widgets/ListViews/boxes_list_view.dart';
import 'package:tobaa/widgets/Templates/property_template.dart';
import 'package:tobaa/widgets/Templates/property_with_hint_template.dart';

import '../../../main.dart';
import '../../Constants/strings.dart';

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
              PropertyTemplate(
                name: Strings.WIDTH,
                value: '${sizeConverter(this._stackLevel.dimensions.width)}',
              ),
              PropertyTemplate(
                name: Strings.LENGTH,
                value: '${sizeConverter(this._stackLevel.dimensions.length)}',
              ),
              PropertyTemplate(
                name: Strings.HEIGHT,
                value: '${sizeConverter(this._stackLevel.dimensions.height)}',
              ),
              PropertyTemplate(
                name: Strings.NEW,
                value:
                    '${massConverter(this._stackLevel.weights.netExplosive)}',
              ),
              PropertyWithHintTemplate(
                Strings.HINT_NET_WEIGHT,
                Strings.NET_WEIGHT,
                '${massConverter(this._stackLevel.weights.net)}',
              ),
              PropertyWithHintTemplate(
                Strings.HINT_GROSS_WEIGHT,
                Strings.GROSS_WEIGHT,
                '${massConverter(this._stackLevel.weights.gross)}',
              ),
              PropertyTemplate(
                name: Strings.NUMBER_OF_THE_CONTAINERS,
                value: '${this._stackLevel.boxes.length}',
              ),
              PropertyTemplate(
                name: Strings.NUMBER_OF_THE_BAA,
                value: '${this._stackLevel.capacities.current}',
              ),
              BoxesListView(this._stackLevel.boxes)
            ],
          ))),
    );
  }
}
