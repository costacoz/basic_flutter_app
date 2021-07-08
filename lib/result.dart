import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final VoidCallback resetCallback;

  Result(this._totalScore, this.resetCallback);

  String get resultPhrase {
    String resultText;
    if (_totalScore > 20) {
      resultText = "You must be lucky to be you";
    } else if (_totalScore > 10) {
      resultText = "You are a normal person";
    } else {
      resultText = "You might consider changing your life";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(resultPhrase),
          Text("Thank you for participating!"),
          TextButton(onPressed: resetCallback, child: Text("Restart"),)
        ],
      )
    );
  }
}
