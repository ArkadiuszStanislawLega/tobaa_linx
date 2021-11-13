import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/constants/app_strings.dart';
import 'package:tobaa/constants/app_urls.dart';

import '../../main.dart';

class MainMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainMenu();
  }
}

class _MainMenu extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 180,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0 ,0.0, 0.0),
              child: Row(
                children: [
                  Text('${Strings.WAR_TIME}'),
                  Switch(
                    value: TOBAAApp.isWar,
                    onChanged: (bool value) => {
                      setState(
                        () {
                          TOBAAApp.isWar = value;
                        },
                      ),
                    },
                  ),
                ],
              ),
            ),
            TextButton(
              child: Text(Strings.SETTINGS),
              onPressed: () => {
                Navigator.pushNamed(context, Url.SETTINGS),
              },
            ),
            TextButton(
              child: Text('O programie'),
              onPressed: () => {
                Navigator.pushNamed(context, Url.SETTINGS),
              },
            ),
            Expanded(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Text('v.0.1')),
            ),
          ],
        ),
      ),
    );
  }
}
