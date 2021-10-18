import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/enumerators/car_type.dart';
import 'package:tobaa/main.dart';

import 'package:tobaa/url.dart';
import 'package:tobaa/app_colors.dart';
import 'package:tobaa/widgets/property_view.dart';

import '../strings.dart';

class CountedView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //TODO: Poprawić to dla każdego samochodu powinien tworzyć nowy transport
    // TOBAAApp.selectedCars.forEach((key, value) {
    //   if (value) {
    //     TOBAAApp.transport.addCar(key);
    //   }
    // });
    // TOBAAApp.transport = new Transport();
    TOBAAApp.transport.selectedCar = CarType.euro_cargo;
    TOBAAApp.transport.createTransport(TOBAAApp.values);

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.TRANSPORT),
      ),
      body: Container(
        child: new SingleChildScrollView(
          child: Container(
              color: Color(AppColors.TRANSPORT),
              child: Column(
                  children: [
                    PropertyView(Strings.NUMBER_OF_THE_BAA,
                        '${TOBAAApp.transport.capacity()}'
                    ),
                    PropertyView(Strings.NEW,
                        ' ${massConverter(
                            TOBAAApp.transport.transportNetExplosiveWeight)}'
                    ),
                    PropertyView(Strings.WEIGHT_OF_ALL_BAA,
                        '${massConverter(
                            TOBAAApp.transport.transportNetWeight)}'
                    ),
                    PropertyView(Strings.GROSS_WEIGHT,
                        '${massConverter(
                            TOBAAApp.transport.transportGrossWeight)}'
                    ),
                    PropertyView(Strings.NUMBER_OF_CARS,
                        '${TOBAAApp.transport.numberOfCars}'
                    ),
                    this._carsListView(TOBAAApp.transport.cars
                    )
                  ])
          ),
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
              title: this._car(cars.elementAt(index), index)
          ),
        );
      },
    );
  }


  Widget _car(Car car, int index) {
    return
      Container(
        color: Color(AppColors.CAR),
        child: Column(
          children: [
            Text('Pojazd numer: ${index+1}'),
            Text('${car.name}'),
            Text('Ilość środków: ${car.capacity()}'),
          ],
        ),
      );
  }
}