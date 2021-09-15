import 'package:flutter/cupertino.dart';

class PropertyView extends StatelessWidget {
  final String name;
  final String value;

  PropertyView(this.name, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(children:
    [
      Expanded(child: Text(this.name, textAlign: TextAlign.left,)),
      Expanded(child: Text(this.value, textAlign: TextAlign.right))],
    );
  }
}