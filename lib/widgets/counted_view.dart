import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/enumerators/car_type.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/main.dart';
import 'package:tobaa/stack/stack_level.dart';

class CountedView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //TODO: Poprawić to dla każdego samochodu powinien tworzyć nowy transport
    // TOBAAApp.selectedCars.forEach((key, value) {
    //   if (value) {
    //     TOBAAApp.transport.addCar(key);
    //   }
    // });

    TOBAAApp.transport.selectedCar = CarType.euro_cargo;
    TOBAAApp.transport.createTransport(TOBAAApp.values);

    return Scaffold(
      appBar: AppBar(
        title: Text("Transport"),
      ),
      body: Container(
          child: new SingleChildScrollView(
              child: Column(
                  children: [
                    Text('${TOBAAApp.transport.transportGrossWeight}'),
                    Text('${TOBAAApp.transport.transportNetExplosiveWeight}'),
                    Text('${TOBAAApp.transport.transportNetWeight}'),
                    Text('${TOBAAApp.transport.numberOfCars}'),
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
                Navigator.pushNamed(context, TOBAAApp.URL_CAR_DETAIL);
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
        Text('Nazwa pojazdu: ${car.name}'),

      ],
    );
  }
}