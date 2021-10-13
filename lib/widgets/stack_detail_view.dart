import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/app_colors.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/url.dart';
import 'package:tobaa/widgets/property_with_hint_view.dart';

import '../main.dart';
import '../strings.dart';

class StackDetailView extends  StatelessWidget {

  final ContainerStack.Stack _stack;

  StackDetailView(this._stack);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: this._stack.levels.isNotEmpty &&
            this._stack.levels.first.boxes.isNotEmpty ?
        Text('${Strings.STACK} ${this._stack.levels.first.boxes.first.name}') :
        Text('${Strings.STACKS_LEVEL} ${this._stack.levels.length}'),
      ),
      body: Container(
          color: Color(AppColors.STACK),
          child: new SingleChildScrollView(
              child: Column(
                children: [
                  Text('${Strings.WIDTH} ${sizeConverter(this._stack.dimensions.width)}'),
                  Text('${Strings.LENGTH} ${sizeConverter(this._stack.dimensions.length)}'),
                  Text('${Strings.HEIGHT} ${sizeConverter(this._stack.dimensions.height)}'),
                  Text('${Strings.NEW} ${massConverter(
                      this._stack.weights.netExplosive)}'),
                  PropertyWithHint(Strings.HINT_NET_WEIGHT,
                      Strings.NET_WEIGHT,
                      '${massConverter(this._stack.weights.net)}'),
                  PropertyWithHint(Strings.HINT_GROSS_WEIGHT,
                      Strings.GROSS_WEIGHT,
                      '${massConverter(this._stack.weights.gross)}'),
                  Text('${Strings.NUMBER_OF_THE_BAA} ${this._stack
                      .battleAirAssetCapacities.current}'),
                  Text('${Strings.MAX_STACK_LEVEL} ${this._stack
                      .maximumStackLevel}'),
                  this._listViewStackLevel(this._stack.levels)
                ],
              )
          )
      ),
    );
  }

  Widget _listViewStackLevel(List<StackLevel> levels) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: levels.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              onTap: () {
                TOBAAApp.selectedStackLevel = levels.elementAt(index);
                Navigator.pushNamed(context, Url.STACK_LEVEL_DETAIL);
              },
              title: this._stackLevel(levels.elementAt(index), index)
          ),
        );
      },
    );
  }

  Widget _stackLevel(StackLevel level, int index) {
    return
      Container(
        color: Color(AppColors.STACK_LEVEL),
        child: Column(
          children: [
            Text('Poziom stosu: ${index + 1}',
                style: TextStyle(fontWeight: FontWeight.w600,)
            ),
            Text('${Strings.NEW} ${massConverter(level.weights.netExplosive)}'),
            Text('${Strings.NET_WEIGHT} ${massConverter(level.weights.net)}'),
            Text('${Strings.GROSS_WEIGHT} ${massConverter(
                level.weights.gross)}'),
            Text('${Strings.NUMBER_OF_THE_CONTAINERS} ${level.boxes.length}'),
            Text('${Strings.NUMBER_OF_THE_BAA} ${level.capacities.current}'),
          ],
        ),
      );
  }
}
