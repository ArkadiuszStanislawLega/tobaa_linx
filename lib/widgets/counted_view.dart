import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/transport/transport.dart';
import 'package:tobaa/widgets/ListViews/transport_list_view.dart';

import 'Constants/app_colors.dart';
import '../main.dart';
import 'Constants/strings.dart';

class CountedView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TOBAAApp.transports.clear();

    TOBAAApp.selectedCars.forEach((key, value) {
      if (value) {
        var tr = new Transport();
        tr.selectedCar = key;
        tr.isWarTime = TOBAAApp.isWar;
        tr.createTransport(TOBAAApp.values);
        TOBAAApp.transports[key] = tr;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.TRANSPORT),
      ),
      body: Container(
        child: new SingleChildScrollView(
          child: Container(
              color: Color(AppColors.TRANSPORT),
              child: transportListView(TOBAAApp.transports.values.toList())
          ),
        ),
      ),
    );
  }
}