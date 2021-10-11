import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;

import '../main.dart';

class CarDetailView extends  StatelessWidget {

  final Car _car;

  CarDetailView(this._car);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._car.name),
      ),
      body: Container(
          child: new SingleChildScrollView(
              child: Column(
                children: [
                  Text('Nazwa pojazdu: ${this._car.name}'),
                  Text('Powierzchnia załadunkowa:'),
                  Container(
                    child: Column(
                      children: [
                        Text('Długość: ${this._car.dimensionOfLoadingArea.length}'),
                        Text('Szerokość: ${this._car.dimensionOfLoadingArea.width}'),
                        Text('Wysokość: ${this._car.dimensionOfLoadingArea.height}'),
                        Text('Dopuszczalna waga: ${massConverter(this._car.weightOfLoadingArea.maximum)}'),
                        Text('Dopuszczalna waga ładunku wybuchowego: ${massConverter(this._car.weightOfLoadingArea.maximumNetExplosive)}'),
                      ],
                    ),
                  ),
                  Text('Klasa wybuchowości: ${this._car.explosionClass.toString()}'),

                  Text('Waga środków wybuchowych: ${massConverter(this._car.weightOfLoadingArea.currentNetExplosive)}'),
                  Text('Waga ładunku: ${massConverter(this._car.weightOfLoadingArea.current)}'),
                  Text('Ilość stosów: ${this._car.stacks.length}'),
                  this._listViewStack(this._car.stacks)
                ],
              )
          )
      ),
    );
  }

  Widget _listViewStack(List<ContainerStack.Stack> stacks){
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: stacks.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
              onTap: (){
                TOBAAApp.selectedStack = stacks.elementAt(index);
                Navigator.pushNamed(context, TOBAAApp.URL_STACK_DETAIL);
              },
              title: this._stack(stacks.elementAt(index))
          ),
        );
      },
    );
  }

  Widget _stack(ContainerStack.Stack stack){
    return Column(
      children: [
        Text('Waga ładunków wybuchowych: ${massConverter(stack.weights.netExplosive)}'),
        Text('Waga netto: ${massConverter(stack.weights.net)}'),
        Text('Waga brutto: ${massConverter(stack.weights.gross)}'),
        Text('Ilość kontenerów: ${stack.currentNumberOfBoxes}'),
        Text('Ilość środków: ${stack.battleAirAssetCapacities.current}'),
      ],
    );
  }

}
