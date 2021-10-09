import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;

class StackDetailView extends  StatelessWidget {

  final ContainerStack.Stack _stack;

  StackDetailView(this._stack);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poziomy stosu: ${this._stack.levels.length}'),
      ),
      body: Container(
          child: new SingleChildScrollView(
              child: Column(
                children: [
                  Text('Ilość środków: ${this._stack.battleAirAssetCapacities.current}'),
                  Text('Szerokość: ${this._stack.dimensions.width}'),
                  Text('Długość: ${this._stack.dimensions.length}'),
                  Text('Wysokość: ${this._stack.dimensions.height}'),
                  Text('Waga netto: ${this._stack.weights.net}'),
                  Text('Waga brutton: ${this._stack.weights.gross}'),
                  Text('Waga netto: ${this._stack.weights.netExplosive}'),
                  Text('Maksymalny poziom stosu: ${this._stack.maximumStackLevel}'),
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
                // TOBAAApp.selectedCars.add(assets.elementAt(index));
                // Navigator.pushNamed(context, TOBAAApp.URL_DETAIL);
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
        Text('NEW: ${level.weights.netExplosive}'),
        Text('Waga netto: ${level.weights.net}'),
        Text('Waga brutto: ${level.weights.gross}'),
        Text('Ilość kontenerów: ${level.boxes.length}'),
        Text('Ilość środków: ${level.capacities.current}'),
      ],
    );
  }
}
