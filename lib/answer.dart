import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onPressedCallback;
  final answerText;

  Answer(this.onPressedCallback, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(answerText),
        style: ElevatedButton.styleFrom(primary: Colors.purple),
        onPressed: () {
          onPressedCallback();
        },
      ),
    );
  }
}
