import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/constans/app_keys.dart';
import 'package:tobaa/constans/app_strings.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/converters/mass_converter.dart';
import 'package:tobaa/converters/size_converter.dart';
import 'package:tobaa/widgets/ListViews/stacks_list_view.dart';
import 'package:tobaa/widgets/Templates/property_game_template.dart';

import '../../../main.dart';

class CarDetailView extends StatelessWidget {
  CarDetailView();

  @override
  Widget build(BuildContext context) {
    var map = ModalRoute.of(context)!.settings.arguments as Map;
    Car car = map[Keys.SELECTED_CAR]!;
    int index = map[Keys.CHOSEN_INDEX]!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${car.name} ${index + 1}'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.developer_board)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(5),
              childAspectRatio: 2.5,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
              children: [
                PropertyGameTemplate(
                  name: Strings.LENGTH,
                  value: '${sizeConverter(car.dimensionOfLoadingArea.length)}',
                  background: Colors.grey[100]!,
                ),
                PropertyGameTemplate(
                  name: Strings.WIDTH,
                  value: '${sizeConverter(car.dimensionOfLoadingArea.width)}',
                  background: Colors.grey[100]!,
                ),
                PropertyGameTemplate(
                  name: Strings.HEIGHT,
                  value: '${sizeConverter(car.dimensionOfLoadingArea.height)}',
                  background: Colors.grey[100]!,
                ),
                PropertyGameTemplate(
                  name: Strings.PERMISSIBLE_WEIGHT,
                  value: '${massConverter(car.weightOfLoadingArea.maximum)}',
                  background: Colors.grey[200]!,
                ),
                PropertyGameTemplate(
                  name: Strings.PERMISSIBLE_NEW,
                  value:
                      '${massConverter(car.weightOfLoadingArea.maximumNetExplosive)}',
                  background: Colors.grey[200]!,
                ),
                PropertyGameTemplate(
                  name: Strings.EXPLOSION_CLASS,
                  value: '${car.explosionClass.toString()}',
                  background: Colors.grey[200]!,
                ),
                PropertyGameTemplate(
                  name: Strings.NEW,
                  value:
                      '${massConverter(car.weightOfLoadingArea.currentNetExplosive)}',
                  background: Colors.grey[300]!,
                ),
                PropertyGameTemplate(
                  name: Strings.LOAD_WEIGHT,
                  value: '${massConverter(car.weightOfLoadingArea.current)}',
                  background: Colors.grey[300]!,
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_THE_STACKS,
                  value: '${car.stacks.length}',
                  background: Colors.grey[300]!,
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_THE_CONTAINERS,
                  value: '${car.numberOfBoxes}',
                  background: Colors.grey[400]!,
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_THE_BAA,
                  value: '${car.numberOfBaa}',
                  background: Colors.grey[400]!,
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_INCOMPLETE_BOXES,
                  value: '${car.numberOfIncompleteBoxes}',
                  background: Colors.grey[400]!,
                ),
              ],
            ),
            StacksListView(car.stacks)
          ],
        ),
      ),
    );
  }
}
