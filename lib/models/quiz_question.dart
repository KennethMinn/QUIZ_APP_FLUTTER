class QuizQuestion {
  final String question;
  final List<String> answers;

  const QuizQuestion(this.question, this.answers);

  List<String> getRandomizedAnswers() {
    final List<String> newAnswers = List.of(answers); // copy array of answers
    newAnswers
        .shuffle(); //shyffle the origin array, now mutate the newAnswers instead of the original answers
    return newAnswers;
  }
}
