import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/car/car.dart';
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
                  Text('${TOBAAApp.CAR_NAME_TITLE} ${this._car.name}'),
                  Text('${TOBAAApp.LOADING_AREA_TITLE}'),
                  Container(
                    child: Column(
                      children: [
                        Text('${TOBAAApp.LENGTH_TITLE} ${this._car.dimensionOfLoadingArea.length}'),
                        Text('${TOBAAApp.WIDTH_TITLE} ${this._car.dimensionOfLoadingArea.width}'),
                        Text('${TOBAAApp.HEIGHT_TITLE} ${this._car.dimensionOfLoadingArea.height}'),
                        Text('${TOBAAApp.PERMISSIBLE_WEIGHT_TITLE} ${massConverter(this._car.weightOfLoadingArea.maximum)}'),
                        Text('${TOBAAApp.PERMISSIBLE_NEW_TITLE} ${massConverter(this._car.weightOfLoadingArea.maximumNetExplosive)}'),
                      ],
                    ),
                  ),
                  Text('${TOBAAApp.EXPLOSION_CLASS_TITLE} ${this._car.explosionClass.toString()}'),

                  Text('${TOBAAApp.NEW_TITLE} ${massConverter(this._car.weightOfLoadingArea.currentNetExplosive)}'),
                  Text('${TOBAAApp.LOAD_WEIGHT_TITLE} ${massConverter(this._car.weightOfLoadingArea.current)}'),
                  Text('${TOBAAApp.NUMBER_OF_THE_STACKS_TITLE} ${this._car.stacks.length}'),
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
        Text('${TOBAAApp.NEW_TITLE} ${massConverter(stack.weights.netExplosive)}'),
        Text('${TOBAAApp.NET_WEIGHT_TITLE} ${massConverter(stack.weights.net)}'),
        Text('${TOBAAApp.GROSS_WEIGHT_TITLE} ${massConverter(stack.weights.gross)}'),
        Text('${TOBAAApp.NUMBER_OF_THE_CONTAINERS_TITLE} ${stack.currentNumberOfBoxes}'),
        Text('${TOBAAApp.NUMBER_OF_THE_BAA_TITLE} ${stack.battleAirAssetCapacities.current}'),
      ],
    );
  }

}
