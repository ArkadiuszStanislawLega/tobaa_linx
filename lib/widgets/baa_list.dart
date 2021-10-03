import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'content_baa_list.dart';

class BaaList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BaaList();
  }

}
class _BaaList extends State<BaaList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
              children: [
                ElevatedButton(
                  child: Text("Ustawienia"),
                  onPressed: () => {
                  Navigator.pushNamed(context, '/settings')
                  },
                ),
                ElevatedButton(
                  child: Text("Przelicz"),
                  onPressed: () => {
                    Navigator.pushNamed(context, '/counted')
                  },
                )
              ],
            )),
        body: ContentBaaList()
    );
  }

}