import 'package:flutter/material.dart';
import '../services/quiz_service.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;

  String selectedAnswer = "";
  bool answered = false;

  void checkAnswer(String answer) {
    if (answered) return;

    setState(() {
      selectedAnswer = answer;
      answered = true;

      if (answer == quizQuestions[currentQuestion].answer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion < quizQuestions.length - 1) {
      setState(() {
        currentQuestion++;
        answered = false;
        selectedAnswer = "";
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("🎉 Quiz Finished"),
          content: Text(
            "Your Score: $score / ${quizQuestions.length}",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                setState(() {
                  currentQuestion = 0;
                  score = 0;
                  answered = false;
                  selectedAnswer = "";
                });
              },
              child: const Text("Restart"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = quizQuestions[currentQuestion];

    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: const Text("📝 Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              "Question ${currentQuestion + 1} / ${quizQuestions.length}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              question.question,
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            ...question.options.map(
              (option) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: answered
                        ? null
                        : () => checkAnswer(option),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        option,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            if (answered)
              Text(
                selectedAnswer == question.answer
                    ? "🎉 Correct!"
                    : "❌ Wrong! Correct Answer: ${question.answer}",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: selectedAnswer == question.answer
                      ? Colors.green
                      : Colors.red,
                ),
              ),

            const SizedBox(height: 20),

            if (answered)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: nextQuestion,
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Next Question",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}