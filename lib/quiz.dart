import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/result.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override //Executed by Flutter when the StatefulWidget's State object is initialized
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = Question(onAddAnswer: onAddAnswer);
    });
  }

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = []; //Object is a dynamic type

    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'selected_answer': selectedAnswers[i],
      });
    }

    return summary;
  }

  void onAddAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer); //add answre to the array
      if (selectedAnswers.length == questions.length) {
        // selectedAnswers = [];
        activeScreen = Result(
          resultSummary: getSummary(),
        );
      }
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 104, 27, 204),
          body: Container(child: activeScreen)),
    );
  }
}
