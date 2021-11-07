import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/widgets/ListViews/stack_levels_list_view.dart';
import 'package:tobaa/widgets/Templates/property_template.dart';
import 'package:tobaa/widgets/Templates/property_with_hint_template.dart';

import '../../../main.dart';
import '../../Constants/strings.dart';

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
              PropertyTemplate(
                name: Strings.WIDTH,
                value: '${sizeConverter(this._stack.dimensions.width)}',
              ),
              PropertyTemplate(
                name: Strings.LENGTH,
                value: '${sizeConverter(this._stack.dimensions.length)}',
              ),
              PropertyTemplate(
                name: Strings.HEIGHT,
                value: '${sizeConverter(this._stack.dimensions.height)}',
              ),
              PropertyTemplate(
                name: Strings.NEW,
                value: '${massConverter(this._stack.weights.netExplosive)}',
              ),
              PropertyWithHintTemplate(
                Strings.HINT_NET_WEIGHT,
                Strings.NET_WEIGHT,
                '${massConverter(this._stack.weights.net)}',
              ),
              PropertyWithHintTemplate(
                Strings.HINT_GROSS_WEIGHT,
                Strings.GROSS_WEIGHT,
                '${massConverter(this._stack.weights.gross)}',
              ),
              PropertyTemplate(
                name: Strings.NUMBER_OF_THE_BAA,
                value: '${this._stack.battleAirAssetCapacities.current}',
              ),
              PropertyTemplate(
                name: Strings.MAX_STACK_LEVEL,
                value: '${this._stack.maximumStackLevel}',
              ),
              StackLevelsListView(this._stack.levels)
            ],
          ),
        ),
      ),
    );
  }
}
