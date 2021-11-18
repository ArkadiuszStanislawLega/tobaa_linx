import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/constants/library.dart';
import 'package:tobaa/main.dart';
import 'package:tobaa/widgets/Templates/main_menu.dart';

import '../ListViews/available_baa_list_view.dart';

class SelectView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectView();
  }
}

class _SelectView extends State<SelectView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND,
      appBar: AppBar(
        backgroundColor: AppColors.BACKGROUND,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.backspace_outlined),
            onPressed: () => {
              setState(
                () {
                  TOBAAApp.values.clear();
                },
              ),
            },
          ),
          IconButton(
            icon: Icon(Icons.double_arrow),
            onPressed: () => {
              Navigator.pushNamed(context, Url.COUNTED),
            },
          ),
        ],
        title: Text(
          'Kalkulator',
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
