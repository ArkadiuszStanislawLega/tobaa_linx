import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/Constants/app_colors.dart';
import 'package:tobaa/Constants/strings.dart';
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
      body: Container(
        child: SingleChildScrollView(
          child: Container(
              color: Color(AppColors.TRANSPORT),
              child: TransportsListView(TOBAAApp.transports.values.toList())
          ),
        ),
      ),
    );
  }
}