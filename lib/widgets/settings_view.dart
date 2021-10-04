import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  bool isWar = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Ustawienia"),
      ),
      body: Column(
        children: [
          Switch(value: isWar, onChanged: (bool value) =>
          {

          }),
          Text("Czas wojny")
        ],
      ),
    );
  }
}