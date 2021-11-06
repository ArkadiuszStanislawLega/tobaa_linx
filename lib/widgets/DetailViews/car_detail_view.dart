import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/widgets/ListViews/stacks_list_view.dart';
import 'package:tobaa/widgets/Templates/property_template.dart';

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
                    PropertyTemplate(Strings.LENGTH,
                        '${sizeConverter(this._car.dimensionOfLoadingArea.length)}'),
                    PropertyTemplate(Strings.WIDTH,
                        '${sizeConverter(this._car.dimensionOfLoadingArea.width)}'),
                    PropertyTemplate(Strings.HEIGHT,
                        '${sizeConverter(this._car.dimensionOfLoadingArea.height)}'),
                    PropertyTemplate(Strings.PERMISSIBLE_WEIGHT,
                        '${massConverter(this._car.weightOfLoadingArea.maximum)}'),
                    PropertyTemplate(Strings.PERMISSIBLE_NEW,
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
                    PropertyTemplate(Strings.EXPLOSION_CLASS,
                        '${this._car.explosionClass.toString()}'),
                    PropertyTemplate(Strings.NEW,
                        '${massConverter(this._car.weightOfLoadingArea.currentNetExplosive)}'),
                    PropertyTemplate(Strings.LOAD_WEIGHT,
                        '${massConverter(this._car.weightOfLoadingArea.current)}'),
                    PropertyTemplate(Strings.NUMBER_OF_THE_STACKS,
                        '${this._car.stacks.length}'),
                  ],
                ),
              ),
              StacksListView(this._car.stacks)
            ],
          ))),
    );
  }
}
