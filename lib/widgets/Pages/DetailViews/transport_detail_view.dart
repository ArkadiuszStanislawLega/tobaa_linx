import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/Constants/strings.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/main.dart';
import 'package:tobaa/transport/transport.dart';
import 'package:tobaa/widgets/ListViews/cars_list_view.dart';
import 'package:tobaa/widgets/Templates/property_template.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            PropertyTemplate(
              name: Strings.NUMBER_OF_THE_BAA,
              value: '${this._transport.capacity()}',
            ),
            PropertyTemplate(
              name: Strings.NEW,
              value: '${massConverter(this._transport.transportNetExplosiveWeight)}',
            ),
            PropertyTemplate(
              name: Strings.WEIGHT_OF_ALL_BAA,
              value: '${massConverter(this._transport.transportNetWeight)}',
            ),
            PropertyTemplate(
              name: Strings.GROSS_WEIGHT,
              value: '${massConverter(this._transport.transportGrossWeight)}',
            ),
            PropertyTemplate(
              name: Strings.NUMBER_OF_CARS,
              value: '${this._transport.numberOfCars}',
            ),
            SizedBox(height: 10),
            CarsListView(this._transport.cars)
          ],
        ),
      ),
    );
  }
}
