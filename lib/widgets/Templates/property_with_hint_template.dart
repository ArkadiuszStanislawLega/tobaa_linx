import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/constans/app_strings.dart';

class PropertyWithHintTemplate extends StatelessWidget {
  final String hint;
  final String propertyName;
  final String propertyValue;
  final Color background;

  PropertyWithHintTemplate(
      {this.hint = "", this.propertyName = "",
        this.propertyValue = "",
      this.background = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        color: this.background,
        // padding: EdgeInsets.symmetric(vertical: 2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              propertyValue,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    this.propertyName,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black45, fontSize: 11),
                  ),
                ),
                IconButton(
                  alignment: Alignment.topRight,
                  iconSize: 15,
                  icon: Icon(
                    Icons.help,
                  ),
                  onPressed: () => {
                    showDialog(
                        builder: (BuildContext context) {
                          return Expanded(
                            child: AlertDialog(
                              title: Text(Strings.HINT),
                              content: Text(this.hint),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: Text(Strings.CLOSE),
                                )
                              ],
                            ),
                          );
                        },
                        context: context)
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
