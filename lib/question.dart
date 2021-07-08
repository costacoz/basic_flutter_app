import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: Text(
        questionText,
        style: TextStyle(
          color: Colors.blueGrey,
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
