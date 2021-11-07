import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/widgets/ListViews/stacks_list_view.dart';
import 'package:tobaa/widgets/Templates/property_template.dart';

import '../../../main.dart';
import '../../Constants/strings.dart';

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
                    PropertyTemplate(
                      name: Strings.LENGTH,
                      value:
                          '${sizeConverter(this._car.dimensionOfLoadingArea.length)}',
                    ),
                    PropertyTemplate(
                      name: Strings.WIDTH,
                      value:
                          '${sizeConverter(this._car.dimensionOfLoadingArea.width)}',
                    ),
                    PropertyTemplate(
                      name: Strings.HEIGHT,
                      value:
                          '${sizeConverter(this._car.dimensionOfLoadingArea.height)}',
                    ),
                    PropertyTemplate(
                      name: Strings.PERMISSIBLE_WEIGHT,
                      value:
                          '${massConverter(this._car.weightOfLoadingArea.maximum)}',
                    ),
                    PropertyTemplate(
                      name: Strings.PERMISSIBLE_NEW,
                      value:
                          '${massConverter(this._car.weightOfLoadingArea.maximumNetExplosive)}',
                    ),
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
                    PropertyTemplate(
                      name: Strings.EXPLOSION_CLASS,
                      value: '${this._car.explosionClass.toString()}',
                    ),
                    PropertyTemplate(
                      name: Strings.NEW,
                      value:
                          '${massConverter(this._car.weightOfLoadingArea.currentNetExplosive)}',
                    ),
                    PropertyTemplate(
                      name: Strings.LOAD_WEIGHT,
                      value:
                          '${massConverter(this._car.weightOfLoadingArea.current)}',
                    ),
                    PropertyTemplate(
                      name: Strings.NUMBER_OF_THE_STACKS,
                      value: '${this._car.stacks.length}',
                    ),
                  ],
                ),
              ),
              StacksListView(this._car.stacks)
            ],
          ),
        ),
      ),
    );
  }
}
