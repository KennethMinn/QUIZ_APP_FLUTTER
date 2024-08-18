import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuiz});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          color: const Color.fromARGB(116, 255, 255, 255),
        ),
        const SizedBox(
          height: 40,
        ),
        Text("Welcome to the Quiz Game",
            style: GoogleFonts.bungee(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white)), //border-color
            child: const Text("Start Quiz"))
      ],
    );
  }
}
