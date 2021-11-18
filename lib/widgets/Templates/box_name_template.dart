import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/database/db_boxes.dart';
import 'package:tobaa/enumerators/box_type.dart';

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
