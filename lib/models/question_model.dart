class Question {
  final String text;
  final List<String> option;
  final int correctAnswerIndex;

  const Question({
    required this.text,
    required this.option,
    required this.correctAnswerIndex,
  });
}