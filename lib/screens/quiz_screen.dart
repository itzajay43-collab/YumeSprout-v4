import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/quiz_service.dart';
import '../services/xp_service.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final XpService xpService = XpService();
  late List<QuizQuestion> questions;

  int currentQuestion = 0;
  int score = 0;
  int bestScore = 0;

  int timeLeft = 10;
  Timer? timer;

  String selectedAnswer = "";
  bool answered = false;

  @override
  void initState() {
    super.initState();
    questions = getRandomQuiz();
    loadBestScore();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void checkAnswer(String answer) {
    if (answered) return;

    timer?.cancel();

    setState(() {
      answered = true;
      selectedAnswer = answer;

      if (answer == questions[currentQuestion].answer) {
  score++;

  xpService.addXP(10);
}
    });
  }

  Future<void> nextQuestion() async {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        answered = false;
        selectedAnswer = "";
      });

      startTimer();
    } else {

  timer?.cancel();

  await xpService.addXP(20);

  if (score == questions.length) {
    await xpService.addXP(50);
  }

  await saveBestScore();

  showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text("🎉 Quiz Finished"),
          content: Text(
            "Score : $score / ${questions.length}",
            style: const TextStyle(fontSize: 20),
          ),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.pop(context);

                setState(() {
                  questions = getRandomQuiz();
                  currentQuestion = 0;
                  score = 0;
                  answered = false;
                  selectedAnswer = "";
                });

                startTimer();
              },
              child: const Text("Restart"),
            ),
          ],
        ),
      );
    }
  }

  Future<void> loadBestScore() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      bestScore = prefs.getInt("bestScore") ?? 0;
    });
  }

  Future<void> saveBestScore() async {
    final prefs = await SharedPreferences.getInstance();

    if (score > bestScore) {
      bestScore = score;
      await prefs.setInt("bestScore", score);
    }
  }

  void startTimer() {
    timer?.cancel();

    timeLeft = 10;

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }

        if (timeLeft > 0) {
          setState(() {
            timeLeft--;
          });
        } else {
          timer.cancel();

          if (!answered) {
            checkAnswer("");
          }

          Future.delayed(
            const Duration(milliseconds: 700),
            () {
              if (mounted) {
                nextQuestion();
              }
            },
          );
        }
      },
    );
  }
    @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      backgroundColor: Colors.pink.shade50,

      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: const Text("📝 Quiz"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text(
                "Question ${currentQuestion + 1} / ${questions.length}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: (currentQuestion + 1) / questions.length,
                  minHeight: 10,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: const AlwaysStoppedAnimation(
                    Colors.pink,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "🏆 Best : $bestScore",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),

                  Text(
                    "⭐ Score : $score",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 15),

              Center(
                child: Text(
                  "⏱ $timeLeft s",
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: Text(
                      question.question,
                      style: const TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              ...question.options.map(
                (option) {
                  Color? color;

                  if (answered) {
                    if (option == question.answer) {
                      color = Colors.green;
                    } else if (option == selectedAnswer) {
                      color = Colors.red;
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: SizedBox(
                      height: 58,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!answered) {
                            checkAnswer(option);
                          }
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: color,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15),
                          ),
                        ),
                                                child: Text(
                          option,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 25),

              if (answered)
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: selectedAnswer == question.answer
                        ? Colors.green.shade100
                        : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    selectedAnswer == question.answer
                        ? "🎉 Correct Answer!"
                        : "❌ Correct Answer: ${question.answer}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: selectedAnswer == question.answer
                          ? Colors.green.shade900
                          : Colors.red.shade900,
                    ),
                  ),
                ),

              const SizedBox(height: 20),

              if (answered)
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: FilledButton.icon(
                    onPressed: nextQuestion,
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text(
                      "Next Question",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}