import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({super.key, required this.item});

  final Map<String, Object> item;

  @override
  Widget build(BuildContext context) {
    final bool isCorrect = item['correct_answer'] == item['selected_answer'];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
              width: 30,
              height: 30,
              alignment: Alignment.center, //align the children
              decoration: BoxDecoration(
                  color: isCorrect ? Colors.green : Colors.pink,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(((item['index'] as int) + 1).toString())),
          const SizedBox(width: 20),
          //Expanded: Automatically fills all the available space within the parent widget. It’s a quick way to ensure a child widget takes up the remaining space.
          //Flexible: Allows a child to take up a portion of the available space based on the flex property. It provides more granular control over space distribution among multiple widgets.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['question'] as String),
                Text(
                  item['selected_answer'] as String,
                  style: const TextStyle(color: Colors.pink),
                ),
                Text(
                  item['correct_answer'] as String,
                  style: const TextStyle(color: Colors.green),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
