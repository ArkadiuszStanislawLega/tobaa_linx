import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/database/db_boxes.dart';
import 'package:tobaa/widgets/property_view.dart';

class DetailBaa extends StatelessWidget {
  final BattleAirAsset battleAirAsset;

  DetailBaa(this.battleAirAsset);

  @override
  Widget build(BuildContext context) {
    var box = DatabaseBoxes.container[this.battleAirAsset.boxType]!;
    return Scaffold(
      appBar: AppBar(
          title: Text('${this.battleAirAsset.name} ${this.battleAirAsset
              .explosionClass.toString()}')),
      body: Column(
          children:
          [
              PropertyView(
                'Podklasa wybuchowości:',
                this.battleAirAsset.explosionClass.explosionSubclass
                    .description
            ),
            PropertyView(
                'Grupa kompatybilności:',
                this.battleAirAsset.explosionClass.compatibilityGroup
                    .description
            ),
            PropertyView(
                'Długość:', '${this.battleAirAsset.dimensions.length} mm'
            ),
            PropertyView(
                'Szerokość:', '${this.battleAirAsset.dimensions.width} mm'
            ),
            PropertyView(
                'Wysokość:', '${this.battleAirAsset.dimensions.height} mm'
            ),
            PropertyView(
                'Waga brutton:', '${this.battleAirAsset.weights.gross} g'
            ),
            PropertyView(
                'Waga netto:', '${this.battleAirAsset.weights.net} g'
            ),
            PropertyView(
                'Waga ładunków wybuchowych:',
                '${this.battleAirAsset.weights.netExplosive} g'
            ),
            PropertyView(
                'Kontener:', '${box.name}'
            ),
            PropertyView(
                'Waga netto kontenera:', '${box.weights.net} g'
            ),
            PropertyView(
                'Waga brutto załadowanego kontenera:', '${box.weights.gross} g'
            ),
            PropertyView(
                'Waga środków wybuchowych w pełni załadowanego kontenera:',
                '${box.weights.netExplosive} g'
            ),
            PropertyView(
                'Wysokość:', '${box.dimensions.height} mm'
            ),
            PropertyView(
                'Szerokość:', '${box.dimensions.width} mm'
            ),
            PropertyView(
                'Długośc:', '${box.dimensions.length} mm'
            ),
            PropertyView(
                'Pojemność:', '${box.capacities.maximum} mm'
            ),
            PropertyView(
                'Maksymalna wysokość stosu w trakcie transportu:',
                '${box.maxStackLevel} szt.'
            ),
          ]
      ),
    );
  }
}