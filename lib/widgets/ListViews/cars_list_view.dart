import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/constants/app_keys.dart';
import 'package:tobaa/constants/app_urls.dart';
import 'package:tobaa/widgets/ListItems/car_list_item.dart';

class CarsListView extends StatelessWidget {
  final List<Car> _cars;

  CarsListView(this._cars);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: this._cars.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.pushNamed(context, Url.CAR_DETAIL, arguments: {
              Keys.SELECTED_CAR: this._cars.elementAt(index),
              Keys.CHOSEN_INDEX: index
            });
          },
          title: CarListItem(this._cars.elementAt(index), index),
        );
      },
    );
  }
}
