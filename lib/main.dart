import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

/*
  final -> runtime
  const -> compile
*/

void main() => runApp(QuizzApp());

class QuizzApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    
    return _QuizzAppState();
  }

}

class _QuizzAppState extends State<QuizzApp> {

  final _questions = const [
      {
        'questionText': 'What\'s you favorite color?',
        'answers': [{ 'text' : 'Black', 'score' : 3 }, { 'text' :'Red', 'score' : 2 }, { 'text' : 'Blue', 'score' : 1 }, { 'text' : 'White', 'score' : 0}],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [{ 'text' : 'Rabbit', 'score' : 3 }, {'text' : 'Snake', 'score': 2 }, { 'text' : 'Tiger', 'score' : 1 } , { 'text' : 'Dog', 'score' : 0 }],
      }
    ];
  
  num _questionIndex = 0;
  num _totalScore = 0;

  void _answerQuestions(int score) {
    if(_questionIndex < _questions.length) {
      print('no more questions');
    }

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizz App!'),
        ),
        body: _questionIndex < _questions.length
          ? Quiz(_answerQuestions, _questions, _questionIndex)
          : Result(_totalScore, _resetQuiz)
    ));
  }
}