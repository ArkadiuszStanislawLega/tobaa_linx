import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/Constants/url.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/widgets/ListItems/stack_list_item.dart';

import '../../main.dart';

class StacksListView extends StatelessWidget {
  final List<ContainerStack.Stack> _stacks;

  StacksListView(this._stacks);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: this._stacks.length,
      itemBuilder: (context, index) {
        return Center(
          child: ListTile(
              onTap: () {
                TOBAAApp.selectedStack = this._stacks.elementAt(index);
                Navigator.pushNamed(context, Url.STACK_DETAIL);
              },
              title: StackListItem(this._stacks.elementAt(index), index)),
        );
      },
    );
  }
}
