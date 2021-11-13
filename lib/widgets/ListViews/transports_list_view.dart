import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/constans/app_keys.dart';
import 'package:tobaa/constans/app_urls.dart';
import 'package:tobaa/transport/transport.dart';
import 'package:tobaa/widgets/ListItems/transport_list_item.dart';

class TransportsListView extends StatelessWidget {
  final List<Transport> _transports;

  TransportsListView(this._transports);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: this._transports.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, Url.TRANSPORT_DETAIL, arguments: {
                Keys.SELECTED_TRANSPORT: this._transports.elementAt(index)
              });
            },
            title: TransportListItem(
              this._transports.elementAt(index),
            ),
          ),
        );
      },
    );
  }
}
