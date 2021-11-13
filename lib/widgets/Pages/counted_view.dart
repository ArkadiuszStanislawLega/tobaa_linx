import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/constans/app_strings.dart';
import 'package:tobaa/transport/transport.dart';
import 'package:tobaa/widgets/ListViews/transports_list_view.dart';

import '../../main.dart';


class CountedView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TOBAAApp.transports.clear();

    TOBAAApp.selectedCars.forEach((key, value) {
      if (value) {
        var transport = new Transport();
        transport.selectedCar = key;
        transport.isWarTime = TOBAAApp.isWar;
        transport.createTransport(TOBAAApp.values);
        TOBAAApp.transports[key] = transport;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.TRANSPORT),
      ),
      body: TransportsListView(TOBAAApp.transports.values.toList())
    );
  }
}