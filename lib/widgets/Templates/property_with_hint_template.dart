import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/strings.dart';

class PropertyWithHintTemplate extends StatelessWidget {
  final String hint;
  final String propertyName;
  final String propertyValue;

  PropertyWithHintTemplate(
      {this.hint = "", this.propertyName = "", this.propertyValue = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(this.propertyName),
        ),
        Expanded(
          child: Text(
            propertyValue,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        IconButton(
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
          icon: Icon(Icons.help),
        ),
      ],
    );
  }
}
