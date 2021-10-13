import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/enumerators/car_type.dart';
import 'package:tobaa/main.dart';
import 'package:tobaa/transport/transport.dart';
import 'package:tobaa/url.dart';

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
    TOBAAApp.transport = new Transport();
    TOBAAApp.transport.selectedCar = CarType.euro_cargo;
    TOBAAApp.transport.createTransport(TOBAAApp.values);

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.TRANSPORT),
      ),
      body: Container(
          child: new SingleChildScrollView(
              child: Column(
                  children: [
                    Text('${Strings.NUMBER_OF_THE_BAA} ${TOBAAApp.transport.capacity()}'),
                    Text('${Strings.GROSS_WEIGHT} ${massConverter(TOBAAApp.transport.transportGrossWeight)}'),
                    Text('${Strings.NEW} ${massConverter(TOBAAApp.transport.transportNetExplosiveWeight)}'),
                    Text('${Strings.WEIGHT_OF_ALL_BAA} ${massConverter(TOBAAApp.transport.transportNetWeight)}'),
                    Text('${Strings.NUMBER_OF_CARS} ${TOBAAApp.transport.numberOfCars}'),
                    this._carsListView(TOBAAApp.transport.cars
                      // Text('${transport.transportGrossWeight}')
                    )
                  ])
          )
      ),
    );
  }

  Widget _carsListView(List<Car> cars){
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: cars.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
              onTap: (){
                TOBAAApp.selectedCar = cars.elementAt(index);
                Navigator.pushNamed(context, Url.CAR_DETAIL);
              },
              title: this._car(cars.elementAt(index))
          ),
        );
      },
    );
  }


  Widget _car(Car car){
    return Column(
      children: [
        Text('${Strings.NAME_OF_THE_CAR} ${car.name}'),

      ],
    );
  }
}