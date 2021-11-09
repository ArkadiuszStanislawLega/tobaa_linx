import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/Constants/strings.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/main.dart';
import 'package:tobaa/transport/transport.dart';
import 'package:tobaa/widgets/ListViews/cars_list_view.dart';
import 'package:tobaa/widgets/Templates/property_game_template.dart';
import 'package:tobaa/widgets/Templates/property_template.dart';

class TransportDetailView extends StatelessWidget {
  final Transport _transport;

  TransportDetailView(this._transport);

  @override
  Widget build(BuildContext context) {
    var car = DatabaseCars.container[this._transport.selectedCar]!;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.developer_board)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
          title: Text(car.name),
        ),
        body: TabBarView(
          children: [
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: [
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_THE_BAA,
                  value: '${this._transport.capacity()}',
                ),
                PropertyGameTemplate(
                  name: Strings.NEW,
                  value:
                      '${massConverter(this._transport.transportNetExplosiveWeight)}',
                ),
                PropertyGameTemplate(
                  name: Strings.WEIGHT_OF_ALL_BAA,
                  value: '${massConverter(this._transport.transportNetWeight)}',
                ),
                PropertyGameTemplate(
                  name: Strings.GROSS_WEIGHT,
                  value:
                      '${massConverter(this._transport.transportGrossWeight)}',
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_CARS,
                  value: '${this._transport.numberOfCars}',
                ),
              ],
            ),
            CarsListView(this._transport.cars)
          ],
        ),
      ),
    );
  }
}
