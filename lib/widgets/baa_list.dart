import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/main.dart';
import 'package:tobaa/transport/transport.dart';

import '../strings.dart';
import 'content_baa_list.dart';

class BaaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
              children: [
                ElevatedButton(
                  child: Text(Strings.SETTINGS),
                  onPressed: () => {
                    Navigator.pushNamed(context, TOBAAApp.URL_SETTINGS)
                  },
                ),
                ElevatedButton(
                  child: Text(Strings.COUNT),
                  onPressed: () => {
                    TOBAAApp.transport = new Transport(),
                    // TOBAAApp.transport.isWarTime = TOBAAApp.isWar,
                    Navigator.pushNamed(context, TOBAAApp.URL_COUNTED),
                  },
                )
              ],
            )),
        body: ContentBaaList()
    );
  }
}