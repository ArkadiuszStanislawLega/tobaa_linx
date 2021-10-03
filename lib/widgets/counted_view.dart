import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountedView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Transport"),
        ),
      body: Column(
        children: [
          Text("Content")
        ],
      ),
    );
  }
}