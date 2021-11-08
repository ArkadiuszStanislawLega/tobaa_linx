import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/widgets/Constants/url.dart';
import 'package:tobaa/widgets/Templates/main_menu.dart';

import '../../main.dart';
import '../Constants/strings.dart';
import '../ListViews/available_baa_list_view.dart';

class SelectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ElevatedButton(
            child: Text(Strings.COUNT),
            onPressed: () => {
              Navigator.pushNamed(context, Url.COUNTED),
            },
          ),
        ],
        title: Text(
          'Tobaa ',
          style: TextStyle(fontSize: 20.0, fontFamily: 'MiddleAgesDeco'),
        ),
      ),
      drawer: MainMenu(),
      body: SafeArea(
        child: Container(
          child: AvailableBaaListView(),
        ),
      ),
    );
  }
}