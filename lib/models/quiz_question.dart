class QuizQuestion {
  final String question;
  final List<String> options;

  const QuizQuestion(this.question, this.options);

  List<String> getShuffledOptions() {
    final List<String> newOptions = List.of(options);
    newOptions.shuffle();
    return newOptions;
  }
}
