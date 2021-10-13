import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/database/db_boxes.dart';

import '../main.dart';
import '../strings.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          [
            Text(this.baa.name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(this.baa.explosionClass.toString()),
            Text('${DatabaseBoxes.container[this.baa.boxType]!.name}',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TOBAAApp.values.containsKey(baa.type) ?
            Text('${TOBAAApp.values[baa.type]!}') :
            Text('${0}'),
            ElevatedButton(
              child: Text(Strings.ADD),
              onPressed: this._addBaa,
            ),
          ]
      )
    ]
    );
  }

  void _addBaa() {
    showDialog(builder: (BuildContext context) {
      return Expanded(
        child: AlertDialog(
            title: Text(Strings.ADD),
            content: Column(
              children:
              [
                Text('${Strings.ADD_TO_TRANSPORT} ${baa.name}'),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      hintText: Strings.ENTER_NUMBER_OF_BAA
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
                child: Text(Strings.ADD),
              )
            ]
        ),
      );
    }, context: context);
  }
}