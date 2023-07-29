import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // const QuizPage({super.key});
  List<Map<String, dynamic>> questions = [
    {"question": 'Pregunta 1', "answer": true},
    {"question": 'Pregunta 2', "answer": false},
    {"question": 'Pregunta 3', "answer": false},
    {"question": 'Pregunta 4', "answer": true},
    {"question": '', "answer": false},
  ];

  String btnTrue = 'True';
  String btnFalse = 'False';
  bool enableBtn = true;
  int questionNumber = 0;
  int win = 0;

  //Arr of check and cross icons
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool type) {
    if (questionNumber < questions.length - 1) {
      questions[questionNumber]['answer'] == type
          ? {
              scoreKeeper.add(
                const Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 20.0,
                ),
              ),
              win++
            }
          : scoreKeeper.add(
              const Icon(
                Icons.close,
                color: Colors.red,
                size: 20.0,
              ),
            );
      questionNumber++;

      if (questionNumber == 4) {
        questions[questionNumber]['question'] = 'Your score! $win';
        btnTrue = 'Restart';
        enableBtn = false;
      }
    } else {
      questionNumber = 0;
      scoreKeeper = [];
      win = 0;
      btnTrue = 'True';
      enableBtn = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz App',
        ),
        backgroundColor: const Color(0xff2E3237),
      ),
      backgroundColor: const Color(0xff2E3237),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  questions[questionNumber]['question'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () => checkAnswer(true),
                color: Colors.green,
                child: Text(
                  btnTrue,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: enableBtn ? () => checkAnswer(false) : null,
                color: Colors.redAccent,
                child: Text(
                  btnFalse,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
