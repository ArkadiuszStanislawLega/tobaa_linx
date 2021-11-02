import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/database/db_boxes.dart';
import 'package:tobaa/widgets/Constants/strings.dart';
import 'package:tobaa/widgets/SmallWidgets/property_view.dart';

import '../../main.dart';

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
                      Strings.LENGTH,
                      '${sizeConverter(this.battleAirAsset.dimensions.length)}'
                  ),
                  PropertyView(
                      Strings.WIDTH,
                      '${sizeConverter(this.battleAirAsset.dimensions.width)}'
                  ),
                  PropertyView(
                      Strings.HEIGHT,
                      '${sizeConverter(this.battleAirAsset.dimensions.height)}'
                  ),
                  PropertyView(
                      Strings.GROSS_WEIGHT,
                      '${massConverter(this.battleAirAsset.weights.gross)}'
                  ),
                  PropertyView(
                      Strings.NET_WEIGHT,
                      '${massConverter(this.battleAirAsset.weights.net)}'
                  ),
                  PropertyView(
                      Strings.NEW,
                      '${massConverter(this.battleAirAsset.weights.netExplosive)}'
                  ),
                  PropertyView(
                      Strings.CONTAINER_NAME, '${box.name}'
                  ),
                  PropertyView(
                      Strings.CONTAINER_NET_WEIGHT,
                      '${massConverter(box.weights.net)}'
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
                      Strings.HEIGHT,
                      '${sizeConverter(box.dimensions.height)}'
                  ),
                  PropertyView(
                      Strings.WIDTH,
                      '${sizeConverter(box.dimensions.width)}'
                  ),
                  PropertyView(
                      Strings.LENGTH,
                      '${sizeConverter(box.dimensions.length)}'
                  ),
                  PropertyView(
                      Strings.CAPACITY, '${box.capacities.maximum}'
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
            content: Container(child: SingleChildScrollView( child: Column(
              children:
              [
               this._explosionClass(),
               this._compatibilityGroup(compatibilityGroup)
              ],
            ))),
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

  Widget _explosionClass(){
    return  Container(
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
    );
  }

  Widget _compatibilityGroup(String compatibilityGroup){
    return Container(
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
    );
  }
}