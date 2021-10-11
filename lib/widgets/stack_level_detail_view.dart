import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/stack/stack_level.dart';

import '../main.dart';

class StackLevelDetailView extends  StatelessWidget {

  final StackLevel _stackLevel;

  StackLevelDetailView(this._stackLevel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: this._stackLevel.boxes.length > 0 ?
        Text('Poziom stosu z ${this._stackLevel.boxes.first.name}') :
            Text('${TOBAAApp.NUMBER_OF_THE_BAA_TITLE} ${this._stackLevel.capacities.current}')
      ),
      body: Container(
          child: new SingleChildScrollView(
              child: Column(
                children: [
                  Text('${TOBAAApp.WIDTH_TITLE} ${this._stackLevel.dimensions.width}'),
                  Text('${TOBAAApp.LENGTH_TITLE} ${this._stackLevel.dimensions.length}'),
                  Text('${TOBAAApp.HEIGHT_TITLE} ${this._stackLevel.dimensions.height}'),
                  Text('${TOBAAApp.NET_WEIGHT_TITLE} ${this._stackLevel.weights.net}'),
                  Text('${TOBAAApp.GROSS_WEIGHT_TITLE} ${this._stackLevel.weights.gross}'),
                  Text('${TOBAAApp.NEW_TITLE} ${this._stackLevel.weights.netExplosive}'),
                  Text('${TOBAAApp.NUMBER_OF_THE_CONTAINERS_TITLE} ${this._stackLevel.boxes.length}'),
                  this._listViewBoxes(this._stackLevel.boxes)
                ],
              )
          )
      ),
    );
  }

  Widget _listViewBoxes(List<Box> levels){
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: levels.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
              onTap: (){
                TOBAAApp.selectedBox = levels.elementAt(index);
                Navigator.pushNamed(context, TOBAAApp.URL_BOX_DETAIL);
              },
              title: this._box(levels.elementAt(index))
          ),
        );
      },
    );
  }

  Widget _box(Box box) {
    return Column(
      children: [
        Text('${TOBAAApp.NAME_TITLE} ${box.name}'),
        Text('${TOBAAApp.NEW_TITLE} ${massConverter(box.weights.netExplosive)}'),
        Text('${TOBAAApp.NET_WEIGHT_TITLE} ${massConverter(box.weights.net)}'),
        Text('${TOBAAApp.GROSS_WEIGHT_TITLE} ${massConverter(box.weights.gross)}'),
        Text('${TOBAAApp.NUMBER_OF_THE_BAA_TITLE} ${box.capacities.current}'),
      ],
    );
  }
}
