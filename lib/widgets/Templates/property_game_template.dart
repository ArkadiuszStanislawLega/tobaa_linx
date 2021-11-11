import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PropertyGameTemplate extends StatelessWidget {
  final String name;
  final String value;
  final Color background;
  final Color fontColor;

  PropertyGameTemplate(
      {this.name = '',
      this.value = '',
      this.background = Colors.white,
      this.fontColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              this.value,
              style: TextStyle(
                color: this.fontColor,
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              this.name,
              textAlign: TextAlign.center,
              style: TextStyle(color: this.fontColor, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
