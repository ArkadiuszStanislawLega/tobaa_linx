import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/widgets/Constants/url.dart';

import '../Constants/strings.dart';
import '../ListViews/available_baa_list_view.dart';

class SelectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            Text('Tobaa ',
                style: TextStyle(fontSize: 20.0, fontFamily: 'MiddleAgesDeco')),
            ElevatedButton(
              child: Text(Strings.SETTINGS),
              onPressed: () => {Navigator.pushNamed(context, Url.SETTINGS)},
            ),
            ElevatedButton(
              child: Text(Strings.COUNT),
              onPressed: () => {
                Navigator.pushNamed(context, Url.COUNTED),
              },
            )
          ],
        )),
        body: AvailableBaaListView());
  }
}
