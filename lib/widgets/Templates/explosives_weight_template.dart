import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/converters/mass_converter.dart';

import 'chip_icon_template.dart';

class ExplosivesWeightTemplate extends StatelessWidget {
  final double _weight;

  ExplosivesWeightTemplate(this._weight);

  @override
  Widget build(BuildContext context) {
    return ChipIconTemplate(
        label: '${massConverter(this._weight)}',
        icon: Icons.flare,
        backgroundColor: Colors.blueGrey,
        fontColor: Colors.white);
  }
}
