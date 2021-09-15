import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/database/db_boxes.dart';

class DetailBaa extends StatelessWidget {
  final BattleAirAsset battleAirAsset;

  DetailBaa(this.battleAirAsset);

  @override
  Widget build(BuildContext context) {
    var box = DatabaseBoxes.container[this.battleAirAsset.boxType]!;
    return Scaffold(
      appBar: AppBar(
          title: Text("Transporting Organiser of Battle Air Assets List")),
      body: Column(
          children:
          [
            Row(children: [
              Text('Nazwa:'),
              Text('${this.battleAirAsset.name} ${this.battleAirAsset
                  .explosionClass.toString()}'),
            ],
            ),
            Row(children: [
              Text('Podklasa wybuchowości:'),
              Flexible(
                child: Text(this.battleAirAsset.explosionClass.explosionSubclass
                    .description, overflow: TextOverflow.ellipsis),
              )
            ],
            ),
            Row(children: [
              Text('Grupa kompatybilności:'),
              Flexible(
                  child: Text(
                      this.battleAirAsset.explosionClass.compatibilityGroup
                          .description, textAlign: TextAlign.left)
              ),
            ],
            ),
            Row(children: [
              Text('Długość:'),
              Text('${this.battleAirAsset.dimensions.length} mm'),
            ],
            ),
            Row(children: [
              Text('Szerokość:'),
              Text('${this.battleAirAsset.dimensions.width} mm'),
            ],
            ),
            Row(children: [
              Text('Wysokość:'),
              Text('${this.battleAirAsset.dimensions.height} mm'),
            ],
            ),
            Row(children: [
              Text('Waga brutton:'),
              Text('${this.battleAirAsset.weights.gross} g'),
            ],
            ),
            Row(children: [
              Text('Waga netto:'),
              Text('${this.battleAirAsset.weights.net} g'),
            ],
            ),
            Row(children: [
              Text('Waga ładunków wybuchowych:'),
              Text('${this.battleAirAsset.weights.netExplosive} g'),
            ],
            ),
            Row(children: [
              Text('Kontener:'),
              Text('${box.name}'),
            ],
            ),
            Row(children: [
              Text('Waga netto kontenera:'),
              Text('${box.weights.net} g'),
            ],
            ),
            Row(children: [
              Text('Waga brutto załadowanego kontenera:'),
              Text('${box.weights.gross} g'),
            ],
            ),
            Row(children: [
              Text('Waga środków wybuchowych w pełni załadowanego kontenera:'),
              Text('${box.weights.netExplosive} g'),
            ],
            ),
            Row(children: [
              Text('Wysokość:'),
              Text('${box.dimensions.height} mm'),
            ],
            ),
            Row(children: [
              Text('Szerokość:'),
              Text('${box.dimensions.width} mm'),
            ],
            ),
            Row(children: [
              Text('Długość:'),
              Text('${box.dimensions.length} mm'),
            ],
            ),
            Row(children: [
              Text('Pojemność:'),
              Text('${box.capacities.maximum} mm'),
            ],
            ),
            Row(children: [
              Text('Maksymalna wysokość stosu w trakcie transportu:'),
              Text('${box.maxStackLevel} szt.'),
            ],
            ),
          ]
      ),
    );
  }
}