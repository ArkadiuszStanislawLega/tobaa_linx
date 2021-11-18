import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/constants/library.dart';
import 'package:tobaa/models/library.dart';
import 'package:tobaa/widgets/ListItems/transport_list_item.dart';

class TransportsListView extends StatelessWidget {
  final List<Transport> _transports;

  TransportsListView(this._transports);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: this._transports.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.pushNamed(context, Url.TRANSPORT_DETAIL, arguments: {
              Keys.SELECTED_TRANSPORT: this._transports.elementAt(index)
            });
          },
          title: TransportListItem(
            this._transports.elementAt(index),
          ),
        );
      },
    );
  }
}
