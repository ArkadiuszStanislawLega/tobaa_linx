import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/constants/app_keys.dart';
import 'package:tobaa/constants/app_strings.dart';
import 'package:tobaa/converters/mass_converter.dart';
import 'package:tobaa/database/db_cars.dart';
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
            Container(
              color: Colors.blueGrey,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(10),
                childAspectRatio: 2.1,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
                children: [
                  PropertyGameTemplate(
                    name: Strings.NUMBER_OF_THE_BAA,
                    value: '${transport.capacity()}',
                    background: Colors.grey[100]!,
                  ),
                  PropertyGameTemplate(
                    name: Strings.NEW,
                    value:
                        '${massConverter(transport.transportNetExplosiveWeight)}',
                    background: Colors.grey[100]!,
                  ),
                  PropertyGameTemplate(
                    name: Strings.WEIGHT_OF_ALL_BAA,
                    value: '${massConverter(transport.transportNetWeight)}',
                    background: Colors.grey[100]!,
                  ),
                  PropertyGameTemplate(
                    name: Strings.GROSS_WEIGHT,
                    value:
                        '${massConverter(transport.transportGrossWeight)}',
                    background: Colors.grey[200]!,
                  ),
                  PropertyGameTemplate(
                    name: Strings.NUMBER_OF_CARS,
                    value: '${transport.numberOfCars}',
                    background: Colors.grey[200]!,
                  ),
                  PropertyGameTemplate(
                    name: Strings.NUMBER_OF_THE_CONTAINERS,
                    value: '${transport.numberOfBoxes}',
                    background: Colors.grey[200]!,
                  ),
                  PropertyGameTemplate(
                    name: Strings.NUMBER_OF_THE_BAA,
                    value: '${transport.numberOfBaa}',
                    background: Colors.grey[300]!,
                  ),
                  PropertyGameTemplate(
                    name: Strings.NUMBER_OF_INCOMPLETE_BOXES,
                    value: '${transport.numberOfIncompleteBoxes}',
                    background: Colors.grey[300]!,
                  ),
                  PropertyGameTemplate(
                    name: Strings.NUMBER_OF_THE_STACKS,
                    value: '${transport.numberOfStacks}',
                    background: Colors.grey[300]!,
                  ),
                  PropertyGameTemplate(
                    name: Strings.WAR_TIME,
                    value: '${transport.isWarTime? 'TAK' : 'NIE'}',
                    background: Colors.grey[400]!,
                  ),
                ],
              ),
            ),
            CarsListView(transport.cars)
          ],
        ),
      ),
    );
  }
}
