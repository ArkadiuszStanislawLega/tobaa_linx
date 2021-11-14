import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/constants/app_strings.dart';
import 'package:tobaa/box/box.dart';

class BoxListItem extends StatelessWidget {
  final Box _box;
  final int _index;

  BoxListItem(this._box, this._index);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(7),
            color: Colors.grey,
            child: Column(
              children: [
                Text(
                  Strings.BOX,
                  style: TextStyle(fontSize: 11, color: Colors.black45),
                ),
                Text(
                  '${this._index+1}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              color: Colors.white30,
              child: Text('${this._box.name}', textAlign: TextAlign.center,),
            ),
          ),
        ],
      ),
    );
  }
}