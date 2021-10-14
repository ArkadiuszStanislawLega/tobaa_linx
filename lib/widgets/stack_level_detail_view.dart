import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/app_colors.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/url.dart';
import 'package:tobaa/widgets/property_view.dart';
import 'package:tobaa/widgets/property_with_hint_view.dart';

import '../main.dart';
import '../strings.dart';

class StackLevelDetailView extends  StatelessWidget {

  final StackLevel _stackLevel;

  StackLevelDetailView(this._stackLevel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: this._stackLevel.boxes.length > 0 ?
          Text('Poziom stosu z ${this._stackLevel.boxes.first.name}') :
          Text('${Strings.NUMBER_OF_THE_BAA} ${this._stackLevel.capacities
              .current}')
      ),
      body: Container(
          color: Color(AppColors.STACK_LEVEL),
          child: new SingleChildScrollView(
              child: Column(
                children: [
                  PropertyView(Strings.WIDTH,
                      '${this._stackLevel.dimensions.width}'
                  ),
                  PropertyView(Strings.LENGTH,
                      '${this._stackLevel.dimensions.length}'
                  ),
                  PropertyView(Strings.HEIGHT,
                      '${this._stackLevel.dimensions.height}'
                  ),
                  PropertyView(Strings.NEW,
                      '${this._stackLevel.weights.netExplosive}'
                  ),
                  PropertyWithHint(Strings.HINT_NET_WEIGHT,
                      Strings.NET_WEIGHT,
                      '${this._stackLevel.weights.net}'
                  ),
                  PropertyWithHint(Strings.HINT_GROSS_WEIGHT,
                      Strings.GROSS_WEIGHT,
                      '${this._stackLevel.weights
                          .gross}'
                  ),
                  PropertyView(Strings.NUMBER_OF_THE_CONTAINERS,
                      '${this._stackLevel.boxes.length}'
                  ),
                  PropertyView(Strings.NUMBER_OF_THE_BAA,
                      '${this._stackLevel.capacities.current}'
                  ),
                  this._listViewBoxes(this._stackLevel.boxes)
                ],
              )
          )
      ),
    );
  }

  Widget _listViewBoxes(List<Box> levels) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: levels.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              onTap: () {
                TOBAAApp.selectedBox = levels.elementAt(index);
                Navigator.pushNamed(context, Url.BOX_DETAIL);
              },
              title: this._box(levels.elementAt(index))
          ),
        );
      },
    );
  }

  Widget _box(Box box) {
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
}
