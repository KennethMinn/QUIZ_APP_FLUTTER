import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/models/quiz_question.dart';

class QustionScreen extends StatefulWidget {
  const QustionScreen({super.key, required this.onAddAnswer});

  final void Function(String answer) onAddAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QustionScreen> {
  int activeIndex = 0;

  void onSelectAnswer(String answer) {
    setState(() {
      activeIndex++;
      widget.onAddAnswer(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion currentQuiz = questions[activeIndex];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            textAlign: TextAlign.center,
            currentQuiz.question,
            style: GoogleFonts.bodoniModa(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ...currentQuiz.getShuffledOptions().map((answer) {
            return ElevatedButton(
                onPressed: () {
                  onSelectAnswer(answer);
                },
                child: Text(answer));
          })
        ],
      ),
    );
  }
}
