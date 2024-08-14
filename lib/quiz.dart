import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
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

  @override //Executed by Flutter when the StatefulWidget's State object is initialized
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const Question();
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
