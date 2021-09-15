import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

class Tutorial extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TutorialState();
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
                questionText,
                style: TextStyle(fontSize: 28),
                textAlign: TextAlign.center,)
    );
  }
}


class _TutorialState extends State<Tutorial> {
  final _questions = [
    {
      'questionText': 'What\'s your favorite colour?',
      'answers':
      [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 3},
        {'text': 'Gray', 'score': 5},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers':
      [
        {'text': 'Cat', 'score': 1},
        {'text': 'Dog', 'score': 10},
        {'text': 'Elephant', 'score': 4},
        {'text': 'Fish', 'score': 9}
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers':
      [
        {'text': 'Monika', 'score': 9},
        {'text': 'Arkadiusz', 'score': 10},
        {'text': 'Tomasz', 'score': 4},
        {'text': 'Jacek', 'score': 2}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      this._questionIndex = 0;
      this._totalScore = 0;
    });
  }


  void _answerQuestion(int score) {
    this._totalScore += score;

    setState(() {
      this._questionIndex++;
    });
    print(this._questionIndex);
    if (this._questionIndex < this._questions.length) {

      print('We have more questions!');
    }
    else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Transporting Organiser of Battle Air Assets List")),
        body: this._questionIndex < this._questions.length ?
        Quiz(questions: this._questions,
            answerQuestion: this._answerQuestion,
            questionIndex: this._questionIndex) : Result(this._totalScore, this._resetQuiz)
    );
  }
}