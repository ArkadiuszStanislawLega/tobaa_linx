import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Ustawienia"),
      ),
      body: Column(
        children: [
          Text("Content")
        ],
      ),
    );
  }
}