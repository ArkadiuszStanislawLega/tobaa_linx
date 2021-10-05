import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tobaa/car/car.dart';


import '../main.dart';

class SettingsCarListItem extends StatefulWidget {
  final Car _car;

  SettingsCarListItem(this._car);

  @override
  State<StatefulWidget> createState() {
    return _SettingsCarListItem(this._car);
  }
}

class _SettingsCarListItem extends State<SettingsCarListItem> {
  final Car _car;
  late bool _isCarSelected= false;

  _SettingsCarListItem(this._car){
    this._isCarSelected = TOBAAApp.selectedCars[this._car.type]!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          [
            Text(this._car.name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Switch(value: TOBAAApp.selectedCars[this._car.type]!,
                onChanged: (bool value)=>{
                  setState(() {
                    TOBAAApp.selectedCars[this._car.type] = value;
                  })
                })
          ]),
    ]
    );
  }
}