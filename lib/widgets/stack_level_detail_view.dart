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
            Text('Ilość środków: ${this._stackLevel.capacities.current}')
      ),
      body: Container(
          child: new SingleChildScrollView(
              child: Column(
                children: [
                  Text('Szerokość: ${this._stackLevel.dimensions.width}'),
                  Text('Długość: ${this._stackLevel.dimensions.length}'),
                  Text('Wysokość: ${this._stackLevel.dimensions.height}'),
                  Text('Waga netto: ${this._stackLevel.weights.net}'),
                  Text('Waga brutto: ${this._stackLevel.weights.gross}'),
                  Text('Waga ładunków wybuchowych: ${this._stackLevel.weights.netExplosive}'),
                  Text('Ilość kontenerów: ${this._stackLevel.boxes.length}'),
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
        Text('Nazwa: ${box.name}'),
        Text('Waga ładunków wybuchowych: ${massConverter(box.weights.netExplosive)}'),
        Text('Waga netto: ${massConverter(box.weights.net)}'),
        Text('Waga brutto: ${massConverter(box.weights.gross)}'),
        Text('Ilość środków: ${box.capacities.current}'),
      ],
    );
  }
}
