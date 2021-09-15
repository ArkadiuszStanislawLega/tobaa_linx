import 'package:flutter/cupertino.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String,Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({required this.questions,
        required this.answerQuestion,
        required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(this.questions[this.questionIndex]['questionText'] as String),
      ...(this.questions[this.questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
        return Answer(() => this.answerQuestion(answer['score'] as int), answer['text'] as String);
      })
          .toList()
    ]);
  }
}
