import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/widgets/Constants/url.dart';
import 'package:tobaa/widgets/ListItems/car_list_item.dart';

import '../../main.dart';

class CarsListView extends StatelessWidget {
  final List<Car> _cars;

  CarsListView(this._cars);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: this._cars.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              onTap: () {
                TOBAAApp.selectedCar = this._cars.elementAt(index);
                Navigator.pushNamed(context, Url.CAR_DETAIL);
              },
              title: CarListItem(this._cars.elementAt(index), index)),
        );
      },
    );
  }
}
