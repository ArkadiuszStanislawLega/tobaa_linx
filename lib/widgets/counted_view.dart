import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/enumerators/car_type.dart';
import 'package:tobaa/main.dart';
import 'package:tobaa/transport/transport.dart';

class CountedView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //TODO: Poprawić to dla każdego samochodu powinien tworzyć nowy transport
   TOBAAApp.selectedCars.forEach((key, value) {
     if (value) {
       TOBAAApp.transport.addCar(key);
     }
    });
    //TODO: Sprawdzić dla czego nie wykonuje obliczeń dla normalnych środków, a dla testowych wykonuje normalnie
    TOBAAApp.transport.createTransport(TOBAAApp.values);
    return  Scaffold(
        appBar: AppBar(
          title: Text("Transport"),
        ),
      body: Column(
        children: [
          Text('${TOBAAApp.transport.transportGrossWeight}'),
          Text('${TOBAAApp.transport.transportNetExplosiveWeight}'),
          Text('${TOBAAApp.transport.transportNetWeight}'),
          Text('${TOBAAApp.transport.numberOfCars}'),

          // Text('${transport.transportGrossWeight}')
        ],
      ),
    );
  }
}