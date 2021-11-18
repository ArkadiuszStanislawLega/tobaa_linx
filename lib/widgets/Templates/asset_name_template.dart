import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chip_template.dart';

class AssetNameTemplate extends StatelessWidget{
  final String _name;

  AssetNameTemplate(this._name);

  @override
  Widget build(BuildContext context) {
    return     ChipTemplate(
      label: this._name,
      backgroundColor: Colors.lightBlue,
      fontColor: Colors.white,
    );
  }

}