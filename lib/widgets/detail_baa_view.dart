import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/database/db_boxes.dart';
import 'package:tobaa/widgets/property_view.dart';

import '../main.dart';

class DetailBaa extends StatefulWidget {
  final BattleAirAsset battleAirAsset;
  final VoidCallback selectHandler;

  DetailBaa(this.battleAirAsset, this.selectHandler);
  @override
  State<StatefulWidget> createState() {
    return _DetailBaa(this.battleAirAsset);
  }
}

class _DetailBaa extends State<DetailBaa> {
  BattleAirAsset battleAirAsset;
  String _text = "";

  _DetailBaa(this.battleAirAsset);

  @override
  Widget build(BuildContext context) {

    var value = 0;
    var box = DatabaseBoxes.container[this.battleAirAsset.boxType]!;
    this._text = "wciśnięty";
    return Scaffold(
        appBar: AppBar(
            title: Text('${this.battleAirAsset.name} ${this.battleAirAsset
                .explosionClass.toString()}')),
        body:
        Container(child:
        SingleChildScrollView(child:
        Column(
            children:
            [
              PropertyView(
                  'Podklasa wybuchowości:',
                  this.battleAirAsset.explosionClass.explosionSubclass
                      .description
              ),
              Container(
                child: Column(
                  children: [
                    Text(this._text),
                    ElevatedButton(
                        child: Text(this._text),
                        onPressed: this._changeText
                    )

                  ],
                ),
              )
              ,
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
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(hintText: "Podaj ilość środków"),
                onChanged: (String str) =>
                str.isNotEmpty ? value = int.tryParse(str)! : {},),
              ElevatedButton(child: Text("Dodaj"),
                onPressed: () =>
                {
                  setState(() {
                    TOBAAApp.values[this.battleAirAsset.type] = value;
                  })
                },)
            ]
        )
        )
        )
    );
  }

  _changeText() {
    setState(() {
      if (this._text == "wciśnięty") {
        this._text = "nie wciśnięty";
      }
      else {
        this._text = "wciśnięty";
      }
    });
  }
}


