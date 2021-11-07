import 'package:flutter/cupertino.dart';

class PropertyTemplate extends StatelessWidget {
  final String name;
  final String value;

  PropertyTemplate({this.name='', this.value=''});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Expanded(child: Text(this.name)),
        Expanded(child:
        Text(this.value,
            style: TextStyle(fontWeight: FontWeight.w600,)
        )
        )
      ],
    );
  }
}