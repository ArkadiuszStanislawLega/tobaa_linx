import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/app_colors.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/url.dart';

import '../main.dart';
import '../strings.dart';

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
          color: Color(AppColors.CAR),
          child: new SingleChildScrollView(
              child: Column(
                children: [
                  Text('${Strings.CAR_NAME} ${this._car.name}'),
                  Text('${Strings.LOADING_AREA}'),
                  Container(
                    child: Column(
                      children: [
                        Text('${Strings.LENGTH} ${this._car.dimensionOfLoadingArea.length}'),
                        Text('${Strings.WIDTH} ${this._car.dimensionOfLoadingArea.width}'),
                        Text('${Strings.HEIGHT} ${this._car.dimensionOfLoadingArea.height}'),
                        Text('${Strings.PERMISSIBLE_WEIGHT} ${massConverter(this._car.weightOfLoadingArea.maximum)}'),
                        Text('${Strings.PERMISSIBLE_NEW} ${massConverter(this._car.weightOfLoadingArea.maximumNetExplosive)}'),
                      ],
                    ),
                  ),
                  Text('${Strings.EXPLOSION_CLASS} ${this._car.explosionClass.toString()}'),
                  Text('${Strings.NEW} ${massConverter(this._car.weightOfLoadingArea.currentNetExplosive)}'),
                  Text('${Strings.LOAD_WEIGHT} ${massConverter(this._car.weightOfLoadingArea.current)}'),
                  Text('${Strings.NUMBER_OF_THE_STACKS} ${this._car.stacks.length}'),
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
                Navigator.pushNamed(context, Url.STACK_DETAIL);
              },
              title: this._stack(stacks.elementAt(index))
          ),
        );
      },
    );
  }

  Widget _stack(ContainerStack.Stack stack) {
    return Container(
      color: Color(AppColors.STACK),
      child: Column(
        children: [
          Text('${Strings.NEW} ${massConverter(stack.weights.netExplosive)}'),
          Text('${Strings.NET_WEIGHT} ${massConverter(stack.weights.net)}'),
          Text('${Strings.GROSS_WEIGHT} ${massConverter(stack.weights.gross)}'),
          Text('${Strings.NUMBER_OF_THE_CONTAINERS} ${stack
              .currentNumberOfBoxes}'),
          Text('${Strings.NUMBER_OF_THE_BAA} ${stack.battleAirAssetCapacities
              .current}'),
        ],
      ),
    );
  }

}
