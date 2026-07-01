class QuizQuestion {
  final String question;
  final List<String> options;
  final String answer;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.answer,
  });
}

final quizQuestions = [
  QuizQuestion(
    question: "あ",
    options: ["A", "I", "U", "E"],
    answer: "A",
  ),

  QuizQuestion(
    question: "い",
    options: ["A", "I", "U", "E"],
    answer: "I",
  ),

  QuizQuestion(
    question: "う",
    options: ["A", "I", "U", "E"],
    answer: "U",
  ),

  QuizQuestion(
    question: "え",
    options: ["A", "I", "U", "E"],
    answer: "E",
  ),
];