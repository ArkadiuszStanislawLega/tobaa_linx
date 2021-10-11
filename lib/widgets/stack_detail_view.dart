import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;

import '../main.dart';

class StackDetailView extends  StatelessWidget {

  final ContainerStack.Stack _stack;

  StackDetailView(this._stack);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: this._stack.levels.isNotEmpty && this._stack.levels.first.boxes.isNotEmpty ?
        Text('${TOBAAApp.STACK_TITLE} ${this._stack.levels.first.boxes.first.name}') :
        Text('${TOBAAApp.STACKS_LEVEL_TITLE} ${this._stack.levels.length}'),
      ),
      body: Container(
          child: new SingleChildScrollView(
              child: Column(
                children: [
                  Text('${TOBAAApp.NUMBER_OF_THE_BAA_TITLE} ${this._stack.battleAirAssetCapacities.current}'),
                  Text('${TOBAAApp.WIDTH_TITLE} ${this._stack.dimensions.width}'),
                  Text('${TOBAAApp.LENGTH_TITLE} ${this._stack.dimensions.length}'),
                  Text('${TOBAAApp.HEIGHT_TITLE} ${this._stack.dimensions.height}'),
                  Text('${TOBAAApp.NET_WEIGHT_TITLE} ${massConverter(this._stack.weights.net)}'),
                  Text('${TOBAAApp.GROSS_WEIGHT_TITLE} ${massConverter(this._stack.weights.gross)}'),
                  Text('${TOBAAApp.NEW_TITLE} ${massConverter(this._stack.weights.netExplosive)}'),
                  Text('${TOBAAApp.MAX_STACK_LEVEL_TITLE} ${this._stack.maximumStackLevel}'),
                  this._listViewStackLevel(this._stack.levels)
                ],
              )
          )
      ),
    );
  }

  Widget _listViewStackLevel(List<StackLevel> levels){
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: levels.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
              onTap: (){
                TOBAAApp.selectedStackLevel = levels.elementAt(index);
                Navigator.pushNamed(context, TOBAAApp.URL_STACK_LEVEL_DETAIL);
              },
              title: this._stackLevel(levels.elementAt(index))
          ),
        );
      },
    );
  }

  Widget _stackLevel(StackLevel level) {
    return Column(
      children: [
        Text('${TOBAAApp.NET_WEIGHT_TITLE}${massConverter(level.weights.netExplosive)}'),
        Text('${TOBAAApp.NET_WEIGHT_TITLE} ${massConverter(level.weights.net)}'),
        Text('${TOBAAApp.GROSS_WEIGHT_TITLE} ${massConverter(level.weights.gross)}'),
        Text('${TOBAAApp.NUMBER_OF_THE_CONTAINERS_TITLE} ${level.boxes.length}'),
        Text('${TOBAAApp.NUMBER_OF_THE_BAA_TITLE} ${level.capacities.current}'),
      ],
    );
  }
}
