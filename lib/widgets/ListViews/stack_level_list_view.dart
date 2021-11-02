import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/widgets/Constants/url.dart';
import 'package:tobaa/widgets/ListItems/stack_level_list_item.dart';

import '../../main.dart';

Widget stackLevelListView(List<StackLevel> levels) {
  return new ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: levels.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
            onTap: () {
              TOBAAApp.selectedStackLevel = levels.elementAt(index);
              Navigator.pushNamed(context, Url.STACK_LEVEL_DETAIL);
            },
            title: stackLevelListItem(levels.elementAt(index), index)
        ),
      );
    },
  );
}