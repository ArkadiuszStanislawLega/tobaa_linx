import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/database/db_boxes.dart';
import 'package:tobaa/widgets/Constants/strings.dart';
import 'package:tobaa/widgets/Templates/property_template.dart';

import '../../../main.dart';


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
                  PropertyTemplate(
                      Strings.LENGTH,
                      '${sizeConverter(this.battleAirAsset.dimensions.length)}'
                  ),
                  PropertyTemplate(
                      Strings.WIDTH,
                      '${sizeConverter(this.battleAirAsset.dimensions.width)}'
                  ),
                  PropertyTemplate(
                      Strings.HEIGHT,
                      '${sizeConverter(this.battleAirAsset.dimensions.height)}'
                  ),
                  PropertyTemplate(
                      Strings.GROSS_WEIGHT,
                      '${massConverter(this.battleAirAsset.weights.gross)}'
                  ),
                  PropertyTemplate(
                      Strings.NET_WEIGHT,
                      '${massConverter(this.battleAirAsset.weights.net)}'
                  ),
                  PropertyTemplate(
                      Strings.NEW,
                      '${massConverter(this.battleAirAsset.weights.netExplosive)}'
                  ),
                  PropertyTemplate(
                      Strings.CONTAINER_NAME, '${box.name}'
                  ),
                  PropertyTemplate(
                      Strings.CONTAINER_NET_WEIGHT,
                      '${massConverter(box.weights.net)}'
                  ),
                  PropertyTemplate(
                      Strings.CONTAINER_FULLY_LOADED_GROSS_WEIGHT,
                      '${massConverter(box.weights.gross)}'
                  ),
                  PropertyTemplate(
                      Strings.CONTAINER_FULLY_LOADED_NEW,
                      '${massConverter(box.weights.netExplosive)}'
                  ),
                  PropertyTemplate(
                      Strings.HEIGHT,
                      '${sizeConverter(box.dimensions.height)}'
                  ),
                  PropertyTemplate(
                      Strings.WIDTH,
                      '${sizeConverter(box.dimensions.width)}'
                  ),
                  PropertyTemplate(
                      Strings.LENGTH,
                      '${sizeConverter(box.dimensions.length)}'
                  ),
                  PropertyTemplate(
                      Strings.CAPACITY, '${box.capacities.maximum}'
                  ),
                  PropertyTemplate(
                      Strings.MAX_STACK_HEIGHT_DURING_TRANSPORT,
                      '${box.maxStackLevel} szt.'
                  ),
                  PropertyTemplate(
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
