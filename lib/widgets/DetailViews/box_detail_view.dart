import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/widgets/SmallWidgets/property_view.dart';
import 'package:tobaa/widgets/SmallWidgets/property_with_hint_view.dart';

import '../../main.dart';
import '../Constants/strings.dart';

class BoxDetailView extends  StatelessWidget {

  final Box _box;

  BoxDetailView(this._box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('${this._box.name}')
      ),
      body: Container(
          color: Color(AppColors.BOX),
          child: new SingleChildScrollView(
              child: Column(
                children: [
                  PropertyView(
                      Strings.WIDTH,
                      '${sizeConverter(this._box.dimensions.width)}'
                  ),
                  PropertyView(
                      Strings.LENGTH,
                      '${sizeConverter(this._box.dimensions.length)}'
                  ),
                  PropertyView(
                      Strings.HEIGHT,
                      '${sizeConverter(this._box.dimensions.height)}'
                  ),
                  PropertyWithHint(Strings.HINT_NET_WEIGHT,
                      Strings.NET_WEIGHT,
                      '${massConverter(this._box.weights.net)}'
                  ),
                  PropertyWithHint(Strings.HINT_GROSS_WEIGHT,
                      Strings.GROSS_WEIGHT,
                      '${massConverter(this._box.weights.currentGross)}'
                  ),
                  PropertyView(
                      Strings.NEW,
                      '${massConverter(this._box.weights.currentNetExplosive)}'
                  )
                ],
              )
          )
      ),
    );
  }
}
