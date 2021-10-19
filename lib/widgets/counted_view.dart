import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/transport/transport.dart';
import 'package:tobaa/url.dart';

import '../app_colors.dart';
import '../main.dart';
import '../strings.dart';

class CountedView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TOBAAApp.selectedCars.forEach((key, value) {
      if (value) {
        var tr = new Transport();
        tr.selectedCar = key;
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
              child: Column(
                  children: [
                    this._transportListView(TOBAAApp.transports.values.toList()
                    )
                  ])
          ),
        ),
      ),
    );
  }

  Widget _transportListView(List<Transport> transport) {
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
              title: this._transport(transport.elementAt(index))
          ),
        );
      },
    );
  }

  Widget _transport(Transport transport) {
    var car = DatabaseCars.container[transport.selectedCar]!;
    return
      Container(
        color: Color(AppColors.CAR),
        child: Column(
          children: [
            Text('${car.name}'),
            Text('Ilość pojazdów: ${transport.cars.length}'),
          ],
        ),
      );
  }
}