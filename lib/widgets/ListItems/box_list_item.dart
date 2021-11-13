import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/constans/app_strings.dart';
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
  //   return
  //     Column(
  //       children: [
  //         Text('${this._box.name}', style: TextStyle(fontWeight: FontWeight.w600,)),
  //         Text('${Strings.NEW} ${massConverter(this._box.weights.netExplosive)}'),
  //         Text('${Strings.NET_WEIGHT} ${massConverter(this._box.weights.net)}'),
  //         Text('${Strings.GROSS_WEIGHT} ${massConverter(this._box.weights.gross)}'),
  //         Text('${Strings.NUMBER_OF_THE_BAA} ${this._box.capacities.current}'),
  //       ],
  //     );
  // }
}