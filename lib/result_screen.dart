import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/result_item.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.result, required this.onRestart});

  final List<Map<String, Object>> result;
  final void Function() onRestart;

  @override
  Widget build(BuildContext context) {
    //filter the correct answers - must be only one line expression when using arrow func
    final int correctAnswersQty = result
        .where((item) => item['correct_answer'] == item['selected_answer'])
        .length;

    final int questionQty = questions.length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "U got $correctAnswersQty out of $questionQty questions correctly!",
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                children: result.map((item) {
                  return ResultItem(item: item);
                }).toList(), //Change Iterable to List cuz Columns only accepts list
              ),
            ),
          ),
        ),
        TextButton.icon(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: onRestart,
            label: const Text(
              "Restart Quiz",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
