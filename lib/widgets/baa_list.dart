import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/widgets/Constants/url.dart';

import 'Constants/strings.dart';
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
                    Navigator.pushNamed(context, Url.SETTINGS)
                  },
                ),
                ElevatedButton(
                  child: Text(Strings.COUNT),
                  onPressed: () => {
                    Navigator.pushNamed(context, Url.COUNTED),
                  },
                )
              ],
            )),
        body: ContentBaaList()
    );
  }
}