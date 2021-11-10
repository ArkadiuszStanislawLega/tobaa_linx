import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/Constants/keys.dart';
import 'package:tobaa/Constants/strings.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/main.dart';
import 'package:tobaa/transport/transport.dart';
import 'package:tobaa/widgets/ListViews/cars_list_view.dart';
import 'package:tobaa/widgets/Templates/property_game_template.dart';

class TransportDetailView extends StatelessWidget {
  TransportDetailView();

  @override
  Widget build(BuildContext context) {
    var map = ModalRoute.of(context)!.settings.arguments as Map<String, Transport>;
    Transport transport = map[Keys.SELECTED_TRANSPORT]!;

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
          title: Text(DatabaseCars.container[transport.selectedCar]!.name),
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
                  value: '${transport.capacity()}',
                ),
                PropertyGameTemplate(
                  name: Strings.NEW,
                  value:
                      '${massConverter(transport.transportNetExplosiveWeight)}',
                ),
                PropertyGameTemplate(
                  name: Strings.WEIGHT_OF_ALL_BAA,
                  value: '${massConverter(transport.transportNetWeight)}',
                ),
                PropertyGameTemplate(
                  name: Strings.GROSS_WEIGHT,
                  value:
                      '${massConverter(transport.transportGrossWeight)}',
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_CARS,
                  value: '${transport.numberOfCars}',
                ),
              ],
            ),
            CarsListView(transport.cars)
          ],
        ),
      ),
    );
  }
}
