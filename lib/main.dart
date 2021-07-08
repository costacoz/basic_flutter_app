import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Basic app',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _questions = const [
    {
      'question': "Which continent do you live on?",
      'answers': [
        {"text":"Europe", "score": 10},
        {"text":"North America", "score": 10},
        {"text":"South America", "score": 6},
        {"text":"Asia", "score": 4},
        {"text":"Africa", "score": 2},
      ]
    },
    {
      'question': "What's your favorite food?",
      'answers': [
        {"text":"Pizza", "score": 2},
        {"text":"Soup", "score": 10},
        {"text":"Burger", "score": 1},
      ]
    },
    {
      'question': "How are you feeling?",
      'answers': [
        {"text":"happy", "score": 10},
        {"text":"sad", "score": 2},
        {"text":"excited", "score": 5},
        {"text":"annoyed", "score": 2},
        {"text":"tired", "score": 3},
        {"text":"optimistic", "score": 8},
      ]
    }
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  bool get isMoreQuestionsToBeAnswered {
    return _questionIndex < _questions.length;
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    _totalScore += score;
    if (isMoreQuestionsToBeAnswered) {
      setState(() {
        _questionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter basics app'),
      ),
      body: isMoreQuestionsToBeAnswered
          ? Quiz(questions: _questions, questionIndex: _questionIndex, answerQuestionCallback: answerQuestion)
          : Result(_totalScore, _resetQuiz),
    );
  }
}
