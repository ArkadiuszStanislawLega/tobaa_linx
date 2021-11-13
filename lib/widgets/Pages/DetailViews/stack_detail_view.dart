import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/constants/app_keys.dart';
import 'package:tobaa/constants/app_strings.dart';
import 'package:tobaa/converters/mass_converter.dart';
import 'package:tobaa/converters/size_converter.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/widgets/ListViews/stack_levels_list_view.dart';
import 'package:tobaa/widgets/Templates/property_game_template.dart';
import 'package:tobaa/widgets/Templates/property_with_hint_template.dart';

import '../../../main.dart';

class StackDetailView extends StatelessWidget {
  StackDetailView();

  @override
  Widget build(BuildContext context) {
    var map = ModalRoute.of(context)!.settings.arguments as Map;
    var stack = map[Keys.SELECTED_STACK]!;
    int index = map[Keys.CHOSEN_INDEX];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.developer_board)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
          title: Text(
              '${Strings.STACK} nr: ${index + 1}, ${stack.levels.first.boxes.first.name}'),
        ),
        body: TabBarView(
          children: [
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(5),
              childAspectRatio: 2.5,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
              children: [
                PropertyGameTemplate(
                  name: Strings.WIDTH,
                  value: '${sizeConverter(stack.dimensions.width)}',
                  background: Colors.grey[100]!,
                ),
                PropertyGameTemplate(
                  name: Strings.LENGTH,
                  value: '${sizeConverter(stack.dimensions.length)}',
                  background: Colors.grey[100]!,
                ),
                PropertyGameTemplate(
                  name: Strings.HEIGHT,
                  value: '${sizeConverter(stack.dimensions.height)}',
                  background: Colors.grey[100]!,
                ),
                PropertyGameTemplate(
                  name: Strings.NEW,
                  value: '${massConverter(stack.weights.netExplosive)}',
                  background: Colors.grey[200]!,
                ),
                PropertyWithHintTemplate(
                  hint: Strings.HINT_NET_WEIGHT,
                  propertyName: Strings.NET_WEIGHT,
                  propertyValue: '${massConverter(stack.weights.net)}',
                  background: Colors.grey[200]!,
                ),
                PropertyWithHintTemplate(
                  hint: Strings.HINT_GROSS_WEIGHT,
                  propertyName: Strings.GROSS_WEIGHT,
                  propertyValue: '${massConverter(stack.weights.gross)}',
                  background: Colors.grey[200]!,
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_THE_BAA,
                  value: '${stack.battleAirAssetCapacities.current}',
                  background: Colors.grey[300]!,
                ),
                PropertyGameTemplate(
                  name: Strings.MAX_STACK_LEVEL,
                  value: '${stack.maximumStackLevel}',
                  background: Colors.grey[300]!,
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_STACK_LEVELS,
                  value: '${stack.levels.length}',
                  background: Colors.grey[300]!,
                ),
              ],
            ),
            StackLevelsListView(stack.levels),
          ],
        ),
      ),
    );
  }
}
