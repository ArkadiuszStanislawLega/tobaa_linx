import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/main.dart';
import 'package:tobaa/transport/transport.dart';

import 'package:tobaa/widgets/Constants/url.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
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
                this._carsListView(this._transport.cars)
              ])),
        ),
      ),
    );
  }

  Widget _carsListView(List<Car> cars) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: cars.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              onTap: () {
                TOBAAApp.selectedCar = cars.elementAt(index);
                Navigator.pushNamed(context, Url.CAR_DETAIL);
              },
              title: this._car(cars.elementAt(index), index)),
        );
      },
    );
  }

  Widget _car(Car car, int index) {
    String baa = "";
    Map<BattleAirAssetType, int> container = {};
    car.stacks.forEach((stack) {
      stack.levels.forEach((level) {
        level.boxes.forEach((box) {
          var value = 0;
          if (container.containsKey(box.battleAirAsset.type))
            value = container[box.battleAirAsset.type]!;
          container[box.battleAirAsset.type] = value+box.capacities.current;
        });
      });
    });

    container.forEach((key, value) {
      var ba = DatabaseAssets.container[key]!;
      baa += "${ba.name}: $value szt., ";
    });


    return Container(
      color: Color(AppColors.CAR),
      child: Column(
        children: [
          PropertyView('Pojazd numer:', '${index + 1}'),
          PropertyView('Ilość środków:', '${car.capacity()}'),
          Text('$baa')
        ],
      ),
    );
  }
}
