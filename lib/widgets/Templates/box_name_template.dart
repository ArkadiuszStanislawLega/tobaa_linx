import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/database/library.dart';
import 'package:tobaa/enumerators/library.dart';

import 'chip_template.dart';

class BoxNameTemplate extends StatelessWidget {
  final BoxType _boxType;

  BoxNameTemplate(this._boxType);

  @override
  Widget build(BuildContext context) {
    return ChipTemplate(
      label: '${DatabaseBoxes.container[this._boxType]!.name}',
      backgroundColor: Colors.amberAccent,
      fontColor: Colors.black,
    );
  }
}
