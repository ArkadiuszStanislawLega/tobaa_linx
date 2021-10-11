import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/box/box.dart';

import '../main.dart';

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
                  Text('Szerokość: ${this._box.dimensions.width}'),
                  Text('Długość: ${this._box.dimensions.length}'),
                  Text('Wysokość: ${this._box.dimensions.height}'),
                  Text('Waga netto: ${massConverter(this._box.weights.net)}'),
                  Text('Waga brutto: ${massConverter(this._box.weights.currentGross)}'),
                  Text('Waga ładunków wybuchowych: ${massConverter(this._box.weights.currentNetExplosive)}'),
                ],
              )
          )
      ),
    );
  }
}
