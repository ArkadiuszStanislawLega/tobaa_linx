import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/models/library.dart';

import 'chip_template.dart';

class HazardClassTemplate extends StatelessWidget {
  final ExplosionClass _explosionClass;

  HazardClassTemplate(this._explosionClass);

  @override
  Widget build(BuildContext context) {
    return ChipTemplate(
      label: this._explosionClass.toString(),
      backgroundColor: Colors.deepOrange,
      fontColor: Colors.white,
    );
  }
}
