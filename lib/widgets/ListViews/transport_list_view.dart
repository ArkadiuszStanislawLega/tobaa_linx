import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/transport/transport.dart';
import 'package:tobaa/widgets/Constants/url.dart';
import 'package:tobaa/widgets/ListItems/transport_list_item.dart';

import '../../main.dart';

Widget transportListView(List<Transport> transport) {
  return new ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: transport.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
            onTap: () {
              TOBAAApp.selectedTransport = transport.elementAt(index);
              Navigator.pushNamed(context, Url.TRANSPORT_DETAIL);
            },
            title: transportListItem(transport.elementAt(index))
        ),
      );
    },
  );
}