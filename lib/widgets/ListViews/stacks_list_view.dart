import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/Constants/keys.dart';
import 'package:tobaa/Constants/url.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/widgets/ListItems/stack_list_item.dart';

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
              Navigator.pushNamed(context, Url.STACK_DETAIL, arguments: {
                Keys.SELECTED_STACK: this._stacks.elementAt(index),
                Keys.CHOSEN_INDEX: index
              });
            },
            title: StackListItem(this._stacks.elementAt(index), index),
          ),
        );
      },
    );
  }
}
