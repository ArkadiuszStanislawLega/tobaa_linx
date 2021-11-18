import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackNameTemplate extends StatelessWidget {
  final String _name;

  StackNameTemplate(this._name);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.lightBlue,
      shadowColor: Colors.black,
      elevation: 4.0,
      label: Text(this._name,
        style: TextStyle(
            fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.right,
      ),
    );
  }
}
