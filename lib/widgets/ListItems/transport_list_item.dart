import 'package:flutter/widgets.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/transport/transport.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';

Widget transportListItem(Transport transport) {
  var car = DatabaseCars.container[transport.selectedCar]!;
  return
    Container(
      color: Color(AppColors.CAR),
      child: Column(
        children: [
          Text('${car.name}'),
          Text('Ilość pojazdów: ${transport.cars.length}'),
        ],
      ),
    );
}