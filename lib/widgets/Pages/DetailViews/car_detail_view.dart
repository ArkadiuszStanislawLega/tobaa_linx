import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/Constants/keys.dart';
import 'package:tobaa/Constants/strings.dart';
import 'package:tobaa/car/car.dart';
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
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: [
                PropertyGameTemplate(
                  name: Strings.LENGTH,
                  value: '${sizeConverter(car.dimensionOfLoadingArea.length)}',
                ),
                PropertyGameTemplate(
                  name: Strings.WIDTH,
                  value: '${sizeConverter(car.dimensionOfLoadingArea.width)}',
                ),
                PropertyGameTemplate(
                  name: Strings.HEIGHT,
                  value: '${sizeConverter(car.dimensionOfLoadingArea.height)}',
                ),
                PropertyGameTemplate(
                  name: Strings.PERMISSIBLE_WEIGHT,
                  value: '${massConverter(car.weightOfLoadingArea.maximum)}',
                ),
                PropertyGameTemplate(
                  name: Strings.PERMISSIBLE_NEW,
                  value:
                      '${massConverter(car.weightOfLoadingArea.maximumNetExplosive)}',
                ),
                PropertyGameTemplate(
                  name: Strings.EXPLOSION_CLASS,
                  value: '${car.explosionClass.toString()}',
                ),
                PropertyGameTemplate(
                  name: Strings.NEW,
                  value:
                      '${massConverter(car.weightOfLoadingArea.currentNetExplosive)}',
                ),
                PropertyGameTemplate(
                  name: Strings.LOAD_WEIGHT,
                  value: '${massConverter(car.weightOfLoadingArea.current)}',
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_THE_STACKS,
                  value: '${car.stacks.length}',
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
