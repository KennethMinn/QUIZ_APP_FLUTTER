import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  void startQuiz() {
    setState(() {
      activeScreen = QustionScreen(onAddAnswer: onAddAnswer);
    });
  }

  void onAddAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);

      if (selectedAnswers.length == questions.length) {
        activeScreen = ResultScreen(
          result: getResult(),
          onRestart: onRestart, //immediately invoke to get result
        );
      }
    });
  }

  void onRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = StartScreen(
        startQuiz: startQuiz,
      );
    });
  }

  List<Map<String, Object>> getResult() {
    final List<Map<String, Object>> result = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      result.add({
        'index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].options[0],
        'selected_answer': selectedAnswers[i]
      });
    }

    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activeScreen = StartScreen(
      startQuiz: startQuiz,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.purple,
        child: activeScreen);
  }
}
