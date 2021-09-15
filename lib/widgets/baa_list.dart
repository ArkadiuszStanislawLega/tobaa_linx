import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'content_baa_list.dart';

class BaaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Transporting Organiser of Battle Air Assets Lista")),
        body: ContentBaaList()
    );
  }
}