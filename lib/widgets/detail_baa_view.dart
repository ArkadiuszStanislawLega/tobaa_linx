import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/database/db_boxes.dart';
import 'package:tobaa/strings.dart';
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
                      Strings.LENGTH, '${this.battleAirAsset.dimensions.length} mm'
                  ),
                  PropertyView(
                      Strings.WIDTH, '${this.battleAirAsset.dimensions.width} mm'
                  ),
                  PropertyView(
                      Strings.HEIGHT, '${this.battleAirAsset.dimensions.height} mm'
                  ),
                  PropertyView(
                      Strings.GROSS_WEIGHT, '${massConverter(this.battleAirAsset.weights.gross)} g'
                  ),
                  PropertyView(
                      Strings.NET_WEIGHT, '${massConverter(this.battleAirAsset.weights.net)} g'
                  ),
                  PropertyView(
                      Strings.NEW,
                      '${massConverter(this.battleAirAsset.weights.netExplosive)} g'
                  ),
                  PropertyView(
                      Strings.CONTAINER_NAME, '${box.name}'
                  ),
                  PropertyView(
                      Strings.CONTAINER_NET_WEIGHT, '${massConverter(box.weights.net)} g'
                  ),
                  PropertyView(
                      Strings.CONTAINER_FULLY_LOADED_GROSS_WEIGHT,
                      '${massConverter(box.weights.gross)}'
                  ),
                  PropertyView(
                      Strings.CONTAINER_FULLY_LOADED_NEW,
                      '${massConverter(box.weights.netExplosive)}'
                  ),
                  PropertyView(
                      Strings.HEIGHT, '${box.dimensions.height} mm'
                  ),
                  PropertyView(
                      Strings.WIDTH, '${box.dimensions.width} mm'
                  ),
                  PropertyView(
                      Strings.LENGTH, '${box.dimensions.length} mm'
                  ),
                  PropertyView(
                      Strings.CAPACITY, '${box.capacities.maximum} mm'
                  ),
                  PropertyView(
                      Strings.MAX_STACK_HEIGHT_DURING_TRANSPORT,
                      '${box.maxStackLevel} szt.'
                  ),
                  PropertyView(
                      Strings.NUMBER_OF_CHOSEN_BAA,
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
            title: Text(Strings.INFORMATION),
            content: Column(
              children:
              [
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        children: [
                          Row(
                              children: [
                                Text(Strings.EXPLOSION_SUBCLASS),
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
                          Text('${Strings.COMPATIBILITY_GROUP}'),
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
                child: Text(Strings.CLOSE),
              )
            ]
        ),
      );
    }, context: this.context);
  }
}
