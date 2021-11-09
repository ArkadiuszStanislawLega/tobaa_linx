import 'package:flutter/widgets.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/transport/transport.dart';

class TransportListItem extends StatelessWidget {
  final Transport _transport;

  TransportListItem(this._transport);

  @override
  Widget build(BuildContext context) {
    var car = DatabaseCars.container[this._transport.selectedCar]!;
    return Column(
      children: [
        Text('${car.name}'),
        Text('Ilość pojazdów: ${this._transport.cars.length}'),
      ],
    );
  }
}
