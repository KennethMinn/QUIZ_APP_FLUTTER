import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  final List<Map<String, Object>> resultSummary;

  const Summary({super.key, required this.resultSummary});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: resultSummary.map((result) {
          print(result);
          return Row(
            children: [
              Text(((result['index'] as int) + 1).toString()),
              Expanded(
                child: Column(
                  children: [Text(result['question'] as String)],
                ),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}
