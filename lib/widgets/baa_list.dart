import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/main.dart';

import 'content_baa_list.dart';

class BaaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
              children: [
                ElevatedButton(
                  child: Text("Ustawienia"),
                  onPressed: () => {
                    Navigator.pushNamed(context, TOBAAApp.URL_SETTINGS)
                  },
                ),
                ElevatedButton(
                  child: Text("Przelicz"),
                  onPressed: () => {
                    Navigator.pushNamed(context, TOBAAApp.URL_COUNTED)
                  },
                )
              ],
            )),
        body: ContentBaaList()
    );
  }
}