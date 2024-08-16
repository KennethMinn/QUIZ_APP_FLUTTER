import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/models/quiz_question.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
  final QuizQuestion currentQuestion = questions[0];

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity, //full-width
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, //default is start - vertically
        crossAxisAlignment:
            CrossAxisAlignment.stretch, //default is center - horizontally
        children: [
          Text(
            textAlign: TextAlign.center,
            currentQuestion.question,
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
          const SizedBox(
            height: 20,
          ),
          ...currentQuestion.getRandomizedAnswers().map((answer) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: AnswerButton(text: answer, onTap: () {}),
            );
          })
        ],
      ),
    );
  }
}
