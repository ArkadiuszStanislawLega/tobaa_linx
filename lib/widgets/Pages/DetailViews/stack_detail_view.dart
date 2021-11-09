import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/Constants/app_colors.dart';
import 'package:tobaa/Constants/strings.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/widgets/ListViews/stack_levels_list_view.dart';
import 'package:tobaa/widgets/Templates/property_game_template.dart';
import 'package:tobaa/widgets/Templates/property_with_hint_template.dart';

import '../../../main.dart';

class StackDetailView extends StatelessWidget {
  final ContainerStack.Stack _stack;

  StackDetailView(this._stack);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.developer_board)),
            Tab(icon: Icon(Icons.list)),
          ]),
          title: this._stack.levels.isNotEmpty &&
                  this._stack.levels.first.boxes.isNotEmpty
              ? Text(
                  '${Strings.STACK} ${this._stack.levels.first.boxes.first.name}')
              : Text('${Strings.STACKS_LEVEL} ${this._stack.levels.length}'),
        ),
        body: TabBarView(
          children: [
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: [
                PropertyGameTemplate(
                  name: Strings.WIDTH,
                  value: '${sizeConverter(this._stack.dimensions.width)}',
                ),
                PropertyGameTemplate(
                  name: Strings.LENGTH,
                  value: '${sizeConverter(this._stack.dimensions.length)}',
                ),
                PropertyGameTemplate(
                  name: Strings.HEIGHT,
                  value: '${sizeConverter(this._stack.dimensions.height)}',
                ),
                PropertyGameTemplate(
                  name: Strings.NEW,
                  value: '${massConverter(this._stack.weights.netExplosive)}',
                ),
                PropertyWithHintTemplate(
                  hint: Strings.HINT_NET_WEIGHT,
                  propertyName: Strings.NET_WEIGHT,
                  propertyValue: '${massConverter(this._stack.weights.net)}',
                ),
                PropertyWithHintTemplate(
                  hint: Strings.HINT_GROSS_WEIGHT,
                  propertyName: Strings.GROSS_WEIGHT,
                  propertyValue:
                      '${massConverter(this._stack.weights.gross)}',
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_THE_BAA,
                  value: '${this._stack.battleAirAssetCapacities.current}',
                ),
                PropertyGameTemplate(
                  name: Strings.MAX_STACK_LEVEL,
                  value: '${this._stack.maximumStackLevel}',
                ),
              ],
            ),
            StackLevelsListView(this._stack.levels),
          ],
        ),
      ),
    );
  }
}
