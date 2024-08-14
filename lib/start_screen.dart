import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz; //type + name

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 250,
            color: const Color.fromARGB(130, 255, 255, 255),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 18)),
            onPressed: startQuiz,
            label: const Text("Start quiz"),
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
