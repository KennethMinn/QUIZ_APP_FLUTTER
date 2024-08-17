import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/models/quiz_question.dart';

class Question extends StatefulWidget {
  final void Function(String answer) onAddAnswer;

  const Question({super.key, required this.onAddAnswer});

  @override
  State<Question> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
  int currentQuestionIndex = 0;

  void onSelectAnswer(String answer) {
    setState(() {
      widget.onAddAnswer(answer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final QuizQuestion currentQuestion = questions[
        currentQuestionIndex]; // Moved to the build method to ensure the question updates with each rebuild.

    return SizedBox(
      width: double.infinity, //full-width
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, //default is start - vertically
        crossAxisAlignment:
            CrossAxisAlignment.stretch, //default is center - horizontally
        children: [
          Text(currentQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                  color: const Color.fromARGB(255, 196, 143, 236),
                  fontSize: 26)),
          const SizedBox(
            height: 20,
          ),
          ...currentQuestion.getRandomizedAnswers().map((answer) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: AnswerButton(
                  text: answer,
                  onTap: () {
                    onSelectAnswer(answer);
                  }),
            );
          })
        ],
      ),
    );
  }
}
