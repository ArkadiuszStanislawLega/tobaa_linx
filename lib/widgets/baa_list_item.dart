import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/widgets/content_baa_list.dart';

import '../main.dart';

class BaaListItem extends StatefulWidget {
  final BattleAirAsset baa;

  BaaListItem(this.baa);

  @override
  State<StatefulWidget> createState() {
    return _BaaListItemState(this.baa);
  }
}

class _BaaListItemState extends State<BaaListItem> {
  final BattleAirAsset baa;
  int _userInput = 0;

  _BaaListItemState(this.baa);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
          children:
          [
            Text(baa.name, textAlign: TextAlign.center,),
            Text(baa.explosionClass.toString(), textAlign: TextAlign.center,),
          ]),
      Row(children: [
        TOBAAApp.values.containsKey(baa.type) ?
        Text('${TOBAAApp.values[baa.type]!}') :
        Text('${0}'),
        ElevatedButton(
          child: Text("Dodaj środek"),
          onPressed: this._addBaa,
        ),
      ]
      )
    ]
    );
  }
  void _addBaa(){
    showDialog(builder: (BuildContext context) {
      return Expanded(child: AlertDialog(
          title: Text("Dodaj"),
          content: Column(
            children:
            [
              Text('Dodaj do transportu ${baa.name}'),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    hintText: "Podaj ilość środków"
                ),
                onChanged: (String str) =>
                str.isNotEmpty
                    ? this._userInput = int.tryParse(str)!
                    : {},
              )
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  TOBAAApp.values[this.baa.type] = this._userInput;
                });
                Navigator.pop(context, true);
              },
              child: Text("Dodaj"),
            )
          ]
      ),

      );
    }, context: context);
  }
}