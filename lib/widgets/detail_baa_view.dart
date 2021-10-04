import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/database/db_boxes.dart';
import 'package:tobaa/widgets/property_view.dart';

import '../main.dart';

class DetailBaa extends StatefulWidget {
  final BattleAirAsset battleAirAsset;

  DetailBaa(this.battleAirAsset);
  @override
  State<StatefulWidget> createState() {
    return _DetailBaa(this.battleAirAsset);
  }
}

class _DetailBaa extends State<DetailBaa> {
  BattleAirAsset battleAirAsset;

  _DetailBaa(this.battleAirAsset);

  @override
  Widget build(BuildContext context) {
    var box = DatabaseBoxes.container[this.battleAirAsset.boxType]!;
    return Scaffold(
        appBar: AppBar(
            title: Row(
              children:
              [
                Text('${this.battleAirAsset.name}'),
                ElevatedButton(
                  child: Text(
                      '${this.battleAirAsset.explosionClass.toString()}'
                  ),
                  onPressed: this._showExplosionClass,
                )
              ],
            )
        ),
        body:
        SingleChildScrollView(
            child: Column(
                children: [
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
                      'Waga brutto załadowanego kontenera:',
                      '${box.weights.gross} g'
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
                  PropertyView(
                      'Ilość wybranych środków:',
                      TOBAAApp.values.containsKey(this.battleAirAsset.type) ?
                      '${TOBAAApp.values[this.battleAirAsset.type]} szt.' :
                      '0 szt.'
                  ),
                ]
            )
        )
    );
  }

  void _showExplosionClass() {
    String compatibilityGroup = this.battleAirAsset.explosionClass
        .compatibilityGroup.convertCompatibilityGroup(
        this.battleAirAsset.explosionClass.compatibilityGroup.group);
    showDialog(builder: (BuildContext context) {
      return Expanded(
        child: AlertDialog(
            title: Text("Informacje"),
            content: Column(
              children:
              [
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        children: [
                          Row(
                              children: [
                                Text('Podklasa wybuchowości: ',
                                ),
                                Text('${this.battleAirAsset.explosionClass
                                    .explosionSubclass.id}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ]),
                          Text('${this.battleAirAsset.explosionClass
                              .explosionSubclass.description}',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic
                              )
                          ),
                        ])
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(children: [
                          Text('Grupa kompatybilności: '),
                          Text('$compatibilityGroup',
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                        ),
                        Text('${this
                            .battleAirAsset.explosionClass
                            .compatibilityGroup
                            .description}', style: TextStyle(
                            fontStyle: FontStyle.italic
                        )),
                      ],
                    )
                )
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text("Zamknij"),
              )
            ]
        ),
      );
    }, context: this.context);
  }
}
