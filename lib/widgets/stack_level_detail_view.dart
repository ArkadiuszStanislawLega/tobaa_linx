import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/url.dart';

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
            Text('${Strings.NUMBER_OF_THE_BAA} ${this._stackLevel.capacities.current}')
      ),
      body: Container(
          child: new SingleChildScrollView(
              child: Column(
                children: [
                  Text('${Strings.WIDTH} ${this._stackLevel.dimensions.width}'),
                  Text('${Strings.LENGTH} ${this._stackLevel.dimensions.length}'),
                  Text('${Strings.HEIGHT} ${this._stackLevel.dimensions.height}'),
                  Text('${Strings.NET_WEIGHT} ${this._stackLevel.weights.net}'),
                  Text('${Strings.GROSS_WEIGHT} ${this._stackLevel.weights.gross}'),
                  Text('${Strings.NEW} ${this._stackLevel.weights.netExplosive}'),
                  Text('${Strings.NUMBER_OF_THE_CONTAINERS} ${this._stackLevel.boxes.length}'),
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
                Navigator.pushNamed(context, Url.BOX_DETAIL);
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
        Text('${Strings.NAME} ${box.name}'),
        Text('${Strings.NEW} ${massConverter(box.weights.netExplosive)}'),
        Text('${Strings.NET_WEIGHT} ${massConverter(box.weights.net)}'),
        Text('${Strings.GROSS_WEIGHT} ${massConverter(box.weights.gross)}'),
        Text('${Strings.NUMBER_OF_THE_BAA} ${box.capacities.current}'),
      ],
    );
  }
}
