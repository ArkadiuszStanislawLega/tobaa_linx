import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/box/box.dart';

import '../main.dart';
import '../strings.dart';

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
          child: new SingleChildScrollView(
              child: Column(
                children: [
                  Text('${Strings.WIDTH} ${this._box.dimensions.width}'),
                  Text('${Strings.LENGTH} ${this._box.dimensions.length}'),
                  Text('${Strings.HEIGHT} ${this._box.dimensions.height}'),
                  Text('${Strings.NET_WEIGHT} ${massConverter(this._box.weights.net)}'),
                  Text('${Strings.GROSS_WEIGHT} ${massConverter(this._box.weights.currentGross)}'),
                  Text('${Strings.NEW} ${massConverter(this._box.weights.currentNetExplosive)}'),
                ],
              )
          )
      ),
    );
  }
}
