import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/Constants/strings.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/widgets/Templates/property_game_template.dart';
import 'package:tobaa/widgets/Templates/property_with_hint_template.dart';

import '../../../main.dart';

class BoxDetailView extends StatelessWidget {
  final Box _box;

  BoxDetailView(this._box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${this._box.name}')),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: [
          PropertyGameTemplate(
            name: Strings.WIDTH,
            value: '${sizeConverter(this._box.dimensions.width)}',
          ),
          PropertyGameTemplate(
            name: Strings.LENGTH,
            value: '${sizeConverter(this._box.dimensions.length)}',
          ),
          PropertyGameTemplate(
            name: Strings.HEIGHT,
            value: '${sizeConverter(this._box.dimensions.height)}',
          ),
          PropertyWithHintTemplate(
            hint: Strings.HINT_NET_WEIGHT,
            propertyName: Strings.NET_WEIGHT,
            propertyValue: '${massConverter(this._box.weights.net)}',
          ),
          PropertyWithHintTemplate(
            hint: Strings.HINT_GROSS_WEIGHT,
            propertyName: Strings.GROSS_WEIGHT,
            propertyValue: '${massConverter(this._box.weights.currentGross)}',
          ),
          PropertyGameTemplate(
            name: Strings.NEW,
            value: '${massConverter(this._box.weights.currentNetExplosive)}',
          )
        ],
      ),
    );
  }
}
