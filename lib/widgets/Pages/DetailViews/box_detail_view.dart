import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/widgets/Constants/strings.dart';
import 'package:tobaa/widgets/Templates/property_template.dart';
import 'package:tobaa/widgets/Templates/property_with_hint_template.dart';

import '../../../main.dart';

class BoxDetailView extends StatelessWidget {
  final Box _box;

  BoxDetailView(this._box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${this._box.name}')),
      body: Container(
        color: Color(AppColors.BOX),
        child: new SingleChildScrollView(
          child: Column(
            children: [
              PropertyTemplate(
                name: Strings.WIDTH,
                value: '${sizeConverter(this._box.dimensions.width)}',
              ),
              PropertyTemplate(
                name: Strings.LENGTH,
                value: '${sizeConverter(this._box.dimensions.length)}',
              ),
              PropertyTemplate(
                name: Strings.HEIGHT,
                value: '${sizeConverter(this._box.dimensions.height)}',
              ),
              PropertyWithHintTemplate(
                Strings.HINT_NET_WEIGHT,
                Strings.NET_WEIGHT,
                '${massConverter(this._box.weights.net)}',
              ),
              PropertyWithHintTemplate(
                Strings.HINT_GROSS_WEIGHT,
                Strings.GROSS_WEIGHT,
                '${massConverter(this._box.weights.currentGross)}',
              ),
              PropertyTemplate(
                name: Strings.NEW,
                value:
                    '${massConverter(this._box.weights.currentNetExplosive)}',
              )
            ],
          ),
        ),
      ),
    );
  }
}
