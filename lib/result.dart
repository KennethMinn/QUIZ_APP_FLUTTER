import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/summary.dart';

class Result extends StatelessWidget {
  final List<Map<String, Object>> resultSummary;

  const Result({super.key, required this.resultSummary});

  @override
  Widget build(BuildContext context) {
    final int allQuestions = questions.length;
    final correctAnswers = resultSummary.where((result) {
      return result['correct_answer'] == result['selected_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("U got $correctAnswers out of $allQuestions questions"),
          const SizedBox(height: 20),
          Summary(resultSummary: resultSummary),
          const SizedBox(height: 20),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: const Text("Try again"))
        ],
      ),
    );
  }
}
