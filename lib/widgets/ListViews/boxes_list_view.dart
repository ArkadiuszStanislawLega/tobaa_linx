import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/widgets/Constants/url.dart';
import 'package:tobaa/widgets/ListItems/box_list_item.dart';

import '../../main.dart';

Widget boxesListView(List<Box> levels) {
  return new ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: levels.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
            onTap: () {
              TOBAAApp.selectedBox = levels.elementAt(index);
              Navigator.pushNamed(context, Url.BOX_DETAIL);
            },
            title: BoxListItem(levels.elementAt(index))
        ),
      );
    },
  );
}
