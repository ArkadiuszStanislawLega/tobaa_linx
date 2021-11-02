import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/widgets/Constants/url.dart';
import 'package:tobaa/widgets/SmallWidgets/property_view.dart';

import '../../main.dart';
import '../Constants/strings.dart';

class CarDetailView extends StatelessWidget {
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
              Container(
                child: Column(
                  children: [
                    Text(
                      '${Strings.PARAMETERS_OF_THE_LOADING_AREA}',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    PropertyView(Strings.LENGTH,
                        '${sizeConverter(this._car.dimensionOfLoadingArea.length)}'),
                    PropertyView(Strings.WIDTH,
                        '${sizeConverter(this._car.dimensionOfLoadingArea.width)}'),
                    PropertyView(Strings.HEIGHT,
                        '${sizeConverter(this._car.dimensionOfLoadingArea.height)}'),
                    PropertyView(Strings.PERMISSIBLE_WEIGHT,
                        '${massConverter(this._car.weightOfLoadingArea.maximum)}'),
                    PropertyView(Strings.PERMISSIBLE_NEW,
                        '${massConverter(this._car.weightOfLoadingArea.maximumNetExplosive)}'),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      Strings.LOADED_CARGO_PARAMETERS,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    PropertyView(Strings.EXPLOSION_CLASS,
                        '${this._car.explosionClass.toString()}'),
                    PropertyView(Strings.NEW,
                        '${massConverter(this._car.weightOfLoadingArea.currentNetExplosive)}'),
                    PropertyView(Strings.LOAD_WEIGHT,
                        '${massConverter(this._car.weightOfLoadingArea.current)}'),
                    PropertyView(Strings.NUMBER_OF_THE_STACKS,
                        '${this._car.stacks.length}'),
                  ],
                ),
              ),
              this._listViewStack(this._car.stacks)
            ],
          ))),
    );
  }

  Widget _listViewStack(List<ContainerStack.Stack> stacks) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: stacks.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              onTap: () {
                TOBAAApp.selectedStack = stacks.elementAt(index);
                Navigator.pushNamed(context, Url.STACK_DETAIL);
              },
              title: this._stack(stacks.elementAt(index), index)),
        );
      },
    );
  }

  Widget _stack(ContainerStack.Stack stack, int index) {
    String baa = "";
    Map<BattleAirAssetType, int> container = {};

    stack.levels.forEach((level) {
      level.boxes.forEach((box) {
        var value = 0;
        if (container.containsKey(box.battleAirAsset.type))
          value = container[box.battleAirAsset.type]!;
        container[box.battleAirAsset.type] = value + box.capacities.current;
      });
    });

    container.forEach((key, value) {
      var ba = DatabaseAssets.container[key]!;
      baa += "${ba.name}: $value szt., ";
    });

    return Container(
      color: Color(AppColors.STACK),
      child: Column(
        children: [
          Text('${Strings.STACK} ${index + 1}: ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text('${Strings.NEW} ${massConverter(stack.weights.netExplosive)}'),
          Text('${Strings.NET_WEIGHT} ${massConverter(stack.weights.net)}'),
          Text('${Strings.GROSS_WEIGHT} ${massConverter(stack.weights.gross)}'),
          Text(
              '${Strings.NUMBER_OF_THE_CONTAINERS} ${stack.currentNumberOfBoxes}'),
          Text(
              '${Strings.NUMBER_OF_THE_BAA} ${stack.battleAirAssetCapacities.current}'),
          Text('$baa')
        ],
      ),
    );
  }
}
