import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/Constants/app_colors.dart';
import 'package:tobaa/Constants/strings.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/widgets/ListViews/boxes_list_view.dart';
import 'package:tobaa/widgets/Templates/property_game_template.dart';
import 'package:tobaa/widgets/Templates/property_template.dart';
import 'package:tobaa/widgets/Templates/property_with_hint_template.dart';

import '../../../main.dart';

class StackLevelDetailView extends StatelessWidget {
  final StackLevel _stackLevel;

  StackLevelDetailView(this._stackLevel);

  @override
  Widget build(BuildContext context) {
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
          title: this._stackLevel.boxes.length > 0
              ? Text('Poziom stosu z ${this._stackLevel.boxes.first.name}')
              : Text(
                  '${Strings.NUMBER_OF_THE_BAA} ${this._stackLevel.capacities.current}'),
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
                  value:
                      '${sizeConverter(this._stackLevel.dimensions.width)}',
                ),
                PropertyGameTemplate(
                  name: Strings.LENGTH,
                  value:
                      '${sizeConverter(this._stackLevel.dimensions.length)}',
                ),
                PropertyGameTemplate(
                  name: Strings.HEIGHT,
                  value:
                      '${sizeConverter(this._stackLevel.dimensions.height)}',
                ),
                PropertyGameTemplate(
                  name: Strings.NEW,
                  value:
                      '${massConverter(this._stackLevel.weights.netExplosive)}',
                ),
                PropertyWithHintTemplate(
                  hint: Strings.HINT_NET_WEIGHT,
                  propertyName: Strings.NET_WEIGHT,
                  propertyValue:
                      '${massConverter(this._stackLevel.weights.net)}',
                ),
                PropertyWithHintTemplate(
                  hint: Strings.HINT_GROSS_WEIGHT,
                  propertyName: Strings.GROSS_WEIGHT,
                  propertyValue:
                      '${massConverter(this._stackLevel.weights.gross)}',
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_THE_CONTAINERS,
                  value: '${this._stackLevel.boxes.length}',
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_THE_BAA,
                  value: '${this._stackLevel.capacities.current}',
                ),
              ],
            ),
            BoxesListView(this._stackLevel.boxes),
          ],
        ),
      ),
    );
  }
}
