import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/constants/app_strings.dart';
import 'package:tobaa/converters/mass_converter.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/explosion_class/explosion_class.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/widgets/Templates/chip_icon_template.dart';
import 'package:tobaa/widgets/Templates/chip_template.dart';
import 'package:tobaa/widgets/Templates/explosives_weight_template.dart';
import 'package:tobaa/widgets/Templates/hazard_class_template.dart';
import 'package:tobaa/widgets/Templates/weight_template.dart';

class StackListItem extends StatelessWidget {
  final ContainerStack.Stack _stack;
  final int _index;

  StackListItem(this._stack, this._index);

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
            Strings.STACK,
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
    List<Widget> widgets = [];
    Map<BattleAirAssetType, int> container = {};
    Map<BattleAirAssetType, double> explosionWeights = {};
    Map<BattleAirAssetType, double> weights = {};

    this._stack.levels.forEach((level) {
      level.boxes.forEach((box) {
        var value = 0;
        var explosionWeightValue = 0.0;
        var weightValue = 0.0;

        if (container.containsKey(box.battleAirAsset.type))
          value = container[box.battleAirAsset.type]!;
        container[box.battleAirAsset.type] = value + box.capacities.current;

        if (explosionWeights.containsKey(box.battleAirAsset.type))
          explosionWeightValue = explosionWeights[box.battleAirAsset.type]!;
        explosionWeights[box.battleAirAsset.type] =
            explosionWeightValue + box.weights.currentNetExplosive;

        if (weights.containsKey(box.battleAirAsset.type))
          weightValue = weights[box.battleAirAsset.type]!;
        weights[box.battleAirAsset.type] =
            weightValue + box.weights.currentGross;
      });
    });

    container.forEach(
      (key, value) {
        var ba = DatabaseAssets.container[key]!;
        widgets.add(
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ExplosivesWeightTemplate(explosionWeights[key]!),
                  WeightTemplate(weights[key]!),
                  HazardClassTemplate(ba),
                ],
              ),
              Chip(
                backgroundColor: Colors.lightBlue,
                shadowColor: Colors.black,
                elevation: 4.0,
                label: Text(
                  "${ba.name} - $value ${Strings.PCS}",
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        );
      },
    );

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
        child: Column(children: widgets),
      ),
    );
  }
}
