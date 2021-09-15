import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (this.resultScore >= 30) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 29) {
      resultText = 'Pretty likeable!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(child:
    Column(children: [
      Text(this.resultPhrase,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      TextButton(child:
      Text('Restart Quiz!',
          style:
          TextStyle(color: Colors.blue)),
        onPressed: this.resetHandler,),
    ])
    );
  }
}
