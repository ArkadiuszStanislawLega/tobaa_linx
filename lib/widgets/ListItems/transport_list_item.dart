import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/transport/transport.dart';

class TransportListItem extends StatelessWidget {
  final Transport _transport;

  TransportListItem(this._transport);

  @override
  Widget build(BuildContext context) {
    var car = DatabaseCars.container[this._transport.selectedCar]!;
    return Container(
      color: Colors.grey,
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(7),
            color: Colors.grey,
            child: Column(
              children: [
                Text(
                  'Ilość pojazdów:',
                  style: TextStyle(fontSize: 11, color: Colors.black45),
                ),
                Text(
                  '${this._transport.cars.length}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              color: Colors.white30,
              child: Text('${car.name}', textAlign: TextAlign.center,),
            ),
          ),
        ],
      ),
    );
  }
}
