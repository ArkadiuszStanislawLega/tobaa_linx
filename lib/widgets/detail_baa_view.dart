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
                      TOBAAApp.LENGTH_TITLE, '${this.battleAirAsset.dimensions.length} mm'
                  ),
                  PropertyView(
                      TOBAAApp.WIDTH_TITLE, '${this.battleAirAsset.dimensions.width} mm'
                  ),
                  PropertyView(
                      TOBAAApp.HEIGHT_TITLE, '${this.battleAirAsset.dimensions.height} mm'
                  ),
                  PropertyView(
                      TOBAAApp.GROSS_WEIGHT_TITLE, '${massConverter(this.battleAirAsset.weights.gross)} g'
                  ),
                  PropertyView(
                      TOBAAApp.NET_WEIGHT_TITLE, '${massConverter(this.battleAirAsset.weights.net)} g'
                  ),
                  PropertyView(
                      TOBAAApp.NEW_TITLE,
                      '${massConverter(this.battleAirAsset.weights.netExplosive)} g'
                  ),
                  PropertyView(
                      TOBAAApp.CONTAINER_NAME_TITLE, '${box.name}'
                  ),
                  PropertyView(
                      TOBAAApp.CONTAINER_NET_WEIGHT_TITLE, '${massConverter(box.weights.net)} g'
                  ),
                  PropertyView(
                      TOBAAApp.CONTAINER_FULLY_LOADED_GROSS_WEIGHT_TITLE,
                      '${massConverter(box.weights.gross)}'
                  ),
                  PropertyView(
                      TOBAAApp.CONTAINER_FULLY_LOADED_NEW_TITLE,
                      '${massConverter(box.weights.netExplosive)}'
                  ),
                  PropertyView(
                      TOBAAApp.HEIGHT_TITLE, '${box.dimensions.height} mm'
                  ),
                  PropertyView(
                      TOBAAApp.WIDTH_TITLE, '${box.dimensions.width} mm'
                  ),
                  PropertyView(
                      TOBAAApp.LENGTH_TITLE, '${box.dimensions.length} mm'
                  ),
                  PropertyView(
                      TOBAAApp.CAPACITY_TITLE, '${box.capacities.maximum} mm'
                  ),
                  PropertyView(
                      TOBAAApp.MAX_STACK_HEIGHT_DURING_TRANSPORT_TITLE,
                      '${box.maxStackLevel} szt.'
                  ),
                  PropertyView(
                      TOBAAApp.NUMBER_OF_CHOSEN_BAA_TITLE,
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
            title: Text(TOBAAApp.INFORMATION_TITLE),
            content: Column(
              children:
              [
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        children: [
                          Row(
                              children: [
                                Text(TOBAAApp.EXPLOSION_SUBCLASS_TITLE),
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
                          Text('${TOBAAApp.COMPATIBILITY_GROUP_TITLE}'),
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
                child: Text(TOBAAApp.CLOSE_TITLE),
              )
            ]
        ),
      );
    }, context: this.context);
  }
}
