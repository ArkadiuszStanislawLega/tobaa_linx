import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingView();
  }

}

class _SettingView extends State<SettingsView> {
  bool isWar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ustawienia"),
      ),
      body: Column(
        children: [
          Switch(value: isWar, onChanged: (bool value) =>
          {
            setState(() {
              isWar = value;
            })
          },
          ),
          Text("Czas wojny")
        ],
      ),
    );
  }
}

