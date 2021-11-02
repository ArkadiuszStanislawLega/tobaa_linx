import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/widgets/Constants/url.dart';
import 'package:tobaa/widgets/ListItems/stack_list_item.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import '../../main.dart';

Widget stacksListView(List<ContainerStack.Stack> stacks) {
  return new ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: stacks.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
            onTap: () {
              TOBAAApp.selectedStack = stacks.elementAt(index);
              Navigator.pushNamed(context, Url.STACK_DETAIL);
            },
            title: stackItemView(stacks.elementAt(index), index)),
      );
    },
  );
}
