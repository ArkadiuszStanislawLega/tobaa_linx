import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/Constants/url.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/widgets/ListItems/stack_level_list_item.dart';

import '../../main.dart';

class StackLevelsListView extends StatelessWidget {
  final List<StackLevel> _levels;

  StackLevelsListView(this._levels);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: this._levels.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              onTap: () {
                TOBAAApp.selectedStackLevel = this._levels.elementAt(index);
                Navigator.pushNamed(context, Url.STACK_LEVEL_DETAIL);
              },
              title: StackLevelListItem(this._levels.elementAt(index), index)),
        );
      },
    );
  }
}
