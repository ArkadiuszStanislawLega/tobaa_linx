import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/constants/app_strings.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/converters/mass_converter.dart';
import 'package:tobaa/widgets/Templates/chip_icon_template.dart';
import 'package:tobaa/widgets/Templates/chip_template.dart';
import 'package:tobaa/widgets/Templates/explosives_weight_template.dart';
import 'package:tobaa/widgets/Templates/hazard_class_template.dart';
import 'package:tobaa/widgets/Templates/stack_name_template.dart';
import 'package:tobaa/widgets/Templates/weight_template.dart';

class BoxListItem extends StatelessWidget {
  final Box _box;
  final int _index;

  BoxListItem(this._box, this._index);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shadowColor: Colors.teal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: Row(
          children: [this._left(), this._right()],
        ),
      ),
    );
  }

  Widget _left() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(7),
      color: Colors.grey,
      child: Column(
        children: [
          Text(
            Strings.BOX,
            style: TextStyle(fontSize: 11, color: Colors.black45),
          ),
          Text(
            '${this._index + 1}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _right() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(4.0, 7.0, 4.0, 7.0),
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            this._header(),
            StackNameTemplate('${this._box.name}'),
          ],
        ),
      ),
    );
  }

  Widget _header(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ExplosivesWeightTemplate(this._box.weights.currentNetExplosive),
        WeightTemplate(this._box.weights.currentGross),
        HazardClassTemplate(this._box.battleAirAsset.explosionClass),
      ],
    );
  }
}
