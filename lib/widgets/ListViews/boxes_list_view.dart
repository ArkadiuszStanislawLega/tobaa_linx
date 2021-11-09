import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/Constants/url.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/widgets/ListItems/box_list_item.dart';

import '../../main.dart';

class BoxesListView extends StatelessWidget {
  final List<Box> _boxes;

  BoxesListView(this._boxes);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: this._boxes.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              onTap: () {
                TOBAAApp.selectedBox = this._boxes.elementAt(index);
                Navigator.pushNamed(context, Url.BOX_DETAIL);
              },
              title: BoxListItem(this._boxes.elementAt(index))),
        );
      },
    );
  }
}
