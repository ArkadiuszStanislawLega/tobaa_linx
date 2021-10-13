import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../strings.dart';

class PropertyWithHint extends StatelessWidget{
  final String hint;
  final String propertyName;
  final String propertyValue;

  PropertyWithHint(this.hint, this.propertyName, this.propertyValue);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: () =>
          {
            showDialog(builder: (BuildContext context) {
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
                    ]
                ),
              );
            }, context: context)
          }, icon: Icon(Icons.help)),
          Text('$propertyName $propertyValue'),
        ]
    );
  }
}