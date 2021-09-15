import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      width: double.infinity,
      color: Colors.blue,

      child: ElevatedButton(
          child: Text(
              this.answerText,
              style: TextStyle(color: Colors.white)),
          onPressed: this.selectHandler),
    );
  }
}

