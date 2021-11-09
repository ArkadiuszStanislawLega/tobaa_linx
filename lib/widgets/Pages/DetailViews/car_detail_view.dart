import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/Constants/strings.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/widgets/ListViews/stacks_list_view.dart';
import 'package:tobaa/widgets/Templates/property_game_template.dart';

import '../../../main.dart';

class CarDetailView extends StatelessWidget {
  final Car _car;

  CarDetailView(this._car);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(this._car.name),
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
                  value:
                  '${sizeConverter(this._car.dimensionOfLoadingArea.length)}',
                ),
                PropertyGameTemplate(
                  name: Strings.WIDTH,
                  value:
                  '${sizeConverter(this._car.dimensionOfLoadingArea.width)}',
                ),
                PropertyGameTemplate(
                  name: Strings.HEIGHT,
                  value:
                  '${sizeConverter(this._car.dimensionOfLoadingArea.height)}',
                ),
                PropertyGameTemplate(
                  name: Strings.PERMISSIBLE_WEIGHT,
                  value:
                  '${massConverter(this._car.weightOfLoadingArea.maximum)}',
                ),
                PropertyGameTemplate(
                  name: Strings.PERMISSIBLE_NEW,
                  value:
                  '${massConverter(this._car.weightOfLoadingArea.maximumNetExplosive)}',
                ),
                PropertyGameTemplate(
                  name: Strings.EXPLOSION_CLASS,
                  value: '${this._car.explosionClass.toString()}',
                ),
                PropertyGameTemplate(
                  name: Strings.NEW,
                  value:
                  '${massConverter(this._car.weightOfLoadingArea.currentNetExplosive)}',
                ),
                PropertyGameTemplate(
                  name: Strings.LOAD_WEIGHT,
                  value:
                  '${massConverter(this._car.weightOfLoadingArea.current)}',
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_THE_STACKS,
                  value: '${this._car.stacks.length}',
                ),
              ],
            ),
            StacksListView(this._car.stacks)
          ],
        ),
      ),
    );
  }
}
