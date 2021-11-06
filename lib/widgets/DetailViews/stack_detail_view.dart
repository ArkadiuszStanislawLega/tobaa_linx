import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/widgets/ListViews/stack_levels_list_view.dart';
import 'package:tobaa/widgets/Templates/property_template.dart';
import 'package:tobaa/widgets/Templates/property_with_hint_template.dart';

import '../../main.dart';
import '../Constants/strings.dart';

class StackDetailView extends StatelessWidget {
  final ContainerStack.Stack _stack;

  StackDetailView(this._stack);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: this._stack.levels.isNotEmpty &&
                this._stack.levels.first.boxes.isNotEmpty
            ? Text(
                '${Strings.STACK} ${this._stack.levels.first.boxes.first.name}')
            : Text('${Strings.STACKS_LEVEL} ${this._stack.levels.length}'),
      ),
      body: Container(
          color: Color(AppColors.STACK),
          child: new SingleChildScrollView(
              child: Column(
            children: [
              PropertyTemplate(Strings.WIDTH,
                  '${sizeConverter(this._stack.dimensions.width)}'),
              PropertyTemplate(Strings.LENGTH,
                  '${sizeConverter(this._stack.dimensions.length)}'),
              PropertyTemplate(Strings.HEIGHT,
                  '${sizeConverter(this._stack.dimensions.height)}'),
              PropertyTemplate(Strings.NEW,
                  '${massConverter(this._stack.weights.netExplosive)}'),
              PropertyWithHintTemplate(Strings.HINT_NET_WEIGHT, Strings.NET_WEIGHT,
                  '${massConverter(this._stack.weights.net)}'),
              PropertyWithHintTemplate(Strings.HINT_GROSS_WEIGHT, Strings.GROSS_WEIGHT,
                  '${massConverter(this._stack.weights.gross)}'),
              PropertyTemplate(Strings.NUMBER_OF_THE_BAA,
                  '${this._stack.battleAirAssetCapacities.current}'),
              PropertyTemplate(
                  Strings.MAX_STACK_LEVEL, '${this._stack.maximumStackLevel}'),
              StackLevelsListView(this._stack.levels)
            ],
          ))),
    );
  }
}
