import 'package:codigo_semana5_quizapp/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  QuizBrain quizBrain = QuizBrain();

  String btnTrue = 'True';
  String btnFalse = 'False';
  bool enableBtn = true;

  int win = 0;

  //Arr of check and cross icons
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool type) {
    if (quizBrain.isFinished()) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Quiz App",
        desc: "Estas son tus respuestas!",
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: scoreKeeper,
          ),
        ),
        buttons: [
          DialogButton(
            width: 120,
            onPressed: () => {
              quizBrain.resetQuestion(),
              Navigator.pop(context),
              scoreKeeper.clear(),
              setState(() {})
            },
            child: const Text(
              "Reiniciar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
    }
    quizBrain.getQuestionAnswer() == type
        ? {
            scoreKeeper.add(
              const Icon(
                Icons.check,
                color: Colors.green,
                size: 30.0,
              ),
            ),
            win++
          }
        : scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
              size: 30.0,
            ),
          );

    quizBrain.nextQuestion();
    // if (questionNumber < quizBrain.getQuestionLength() - 1) {
    // if (questionNumber == 4) {
    //   quizBrain.questions[questionNumber]['question'] = 'Your score! $win';
    //   btnTrue = 'Restart';
    //   enableBtn = false;
    // }
    // } else {
    //   quizBrain.resetQuestion();
    //   scoreKeeper = [];
    //   win = 0;
    //   btnTrue = 'True';
    //   enableBtn = true;
    // }
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
                  quizBrain.getQuestionText(),
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
                  style: const TextStyle(
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
                onPressed: () => checkAnswer(false),
                color: Colors.redAccent,
                child: Text(
                  btnFalse,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: scoreKeeper,
          // )
        ],
      ),
    );
  }
}
