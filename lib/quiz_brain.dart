import 'package:codigo_semana5_quizapp/question.dart';

class QuizBrain {
  final List<Question> _questions = [
    Question(
      questionText: 'Pregunta 1',
      questionAnswer: true,
    ),
    Question(
      questionText: 'Pregunta 2',
      questionAnswer: false,
    ),
    Question(
      questionText: 'Pregunta 3',
      questionAnswer: false,
    ),
    Question(
      questionText: 'Pregunta 4',
      questionAnswer: true,
    ),
  ];

  int _questionNumber = 0;

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  int getQuestionLength() {
    return _questions.length;
  }

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  void resetQuestion() {
    _questionNumber = 0;
  }

  bool isFinished() {
    if (_questionNumber >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}


  // List<Map<String, dynamic>> questions = [
  //   {"question": 'Pregunta 1', "answer": true},
  //   {"question": 'Pregunta 2', "answer": false},
  //   {"question": 'Pregunta 3', "answer": false},
  //   {"question": 'Pregunta 4', "answer": true},
  //   {"question": '', "answer": false},
  // ];