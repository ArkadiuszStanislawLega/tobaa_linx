import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/constants/app_keys.dart';
import 'package:tobaa/constants/app_strings.dart';
import 'package:tobaa/converters/mass_converter.dart';
import 'package:tobaa/converters/size_converter.dart';
import 'package:tobaa/widgets/ListViews/boxes_list_view.dart';
import 'package:tobaa/widgets/Templates/property_game_template.dart';
import 'package:tobaa/widgets/Templates/property_with_hint_template.dart';

class StackLevelDetailView extends StatelessWidget {
  StackLevelDetailView();

  @override
  Widget build(BuildContext context) {
    var map = ModalRoute.of(context)!.settings.arguments as Map;
    var stackLevel = map[Keys.SELECTED_STACK_LEVEL]!;
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
          title: Text('${index+1} Poziom stosu z ${stackLevel.boxes.first.name}')
        ),
        body: TabBarView(
          children: [
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              childAspectRatio: 2.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: [
                PropertyGameTemplate(
                  name: Strings.WIDTH,
                  value:
                      '${sizeConverter(stackLevel.dimensions.width)}',
                  background: Colors.grey[100]!,
                ),
                PropertyGameTemplate(
                  name: Strings.LENGTH,
                  value:
                      '${sizeConverter(stackLevel.dimensions.length)}',
                  background: Colors.grey[100]!,
                ),
                PropertyGameTemplate(
                  name: Strings.HEIGHT,
                  value:
                      '${sizeConverter(stackLevel.dimensions.height)}',
                  background: Colors.grey[100]!,
                ),
                PropertyGameTemplate(
                  name: Strings.NEW,
                  value:
                      '${massConverter(stackLevel.weights.netExplosive)}',
                  background: Colors.grey[200]!,
                ),
                PropertyWithHintTemplate(
                  hint: Strings.HINT_NET_WEIGHT,
                  propertyName: Strings.NET_WEIGHT,
                  propertyValue:
                      '${massConverter(stackLevel.weights.net)}',
                  background: Colors.grey[200]!,
                ),
                PropertyWithHintTemplate(
                  hint: Strings.HINT_GROSS_WEIGHT,
                  propertyName: Strings.GROSS_WEIGHT,
                  propertyValue:
                      '${massConverter(stackLevel.weights.gross)}',
                  background: Colors.grey[200]!,
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_THE_CONTAINERS,
                  value: '${stackLevel.boxes.length}',
                  background: Colors.grey[300]!,
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_THE_BAA,
                  value: '${stackLevel.capacities.current}',
                  background: Colors.grey[300]!,
                ),
              ],
            ),
            BoxesListView(stackLevel.boxes),
          ],
        ),
      ),
    );
  }
}
