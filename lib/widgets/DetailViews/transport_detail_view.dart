import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/main.dart';
import 'package:tobaa/transport/transport.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/widgets/ListViews/cars_list_view.dart';
import 'package:tobaa/widgets/SmallWidgets/property_view.dart';

import '../Constants/strings.dart';

class TransportDetailView extends StatelessWidget {
  final Transport _transport;

  TransportDetailView(this._transport);

  @override
  Widget build(BuildContext context) {
    var car = DatabaseCars.container[this._transport.selectedCar]!;
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name),
      ),
      body: Container(
        child: new SingleChildScrollView(
          child: Container(
              color: Color(AppColors.TRANSPORT),
              child: Column(children: [
                PropertyView(
                    Strings.NUMBER_OF_THE_BAA, '${this._transport.capacity()}'),
                PropertyView(Strings.NEW,
                    ' ${massConverter(this._transport.transportNetExplosiveWeight)}'),
                PropertyView(Strings.WEIGHT_OF_ALL_BAA,
                    '${massConverter(this._transport.transportNetWeight)}'),
                PropertyView(Strings.GROSS_WEIGHT,
                    '${massConverter(this._transport.transportGrossWeight)}'),
                PropertyView(
                    Strings.NUMBER_OF_CARS, '${this._transport.numberOfCars}'),
                CarsListView(this._transport.cars)
              ])),
        ),
      ),
    );
  }
}
