import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/enumerators/baa_type.dart';

import 'content_baa_list.dart';

class BaaList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BaaList();
  }

}
class _BaaList extends State<BaaList> {
  String _text = "wcisnij";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Transporting Organiser of Battle Air Assets Lista")),
        body: ContentBaaList()
    );
  }

}