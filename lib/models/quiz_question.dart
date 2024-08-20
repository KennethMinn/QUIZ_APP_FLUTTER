class QuizQuestion {
  final String question;
  final List<String> options;

  const QuizQuestion(this.question, this.options);

  //getter - if there is no arg/input, use getter - can use like a propertie but overall is a method
  List<String> get shuffledOptions {
    final List<String> newOptions = List.of(options);
    newOptions.shuffle();
    return newOptions;
  }
}
