import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final num totalScore;

  final Function resetHandler;

  Result(this.totalScore, this.resetHandler);



  String get resultPhrase {
    return 'Congratulatios! You did it! Your score is: ' + this.totalScore.toString(); 
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget> [
          Text(
            resultPhrase,
            style: TextStyle (
              fontSize: 36,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz',
            ),
            textColor: Colors.indigoAccent,
            onPressed: this.resetHandler,
          )
        ]
      )
    );
  }
}