import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PropertyGameTemplate extends StatelessWidget {
  final String name;
  final String value;
  final Color background;
  final Color fontColor;

  PropertyGameTemplate(
      {this.name = '', this.value = '', this.background = Colors.white, this.fontColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              this.name,
              style: TextStyle(
                  color: this.fontColor,
                  fontSize: 12),
            ),
          ),
          Expanded(
            child: Text(
              this.value,
              style: TextStyle(
                color: this.fontColor,
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
