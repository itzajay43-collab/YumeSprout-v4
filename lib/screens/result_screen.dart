import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final int xpEarned;
  final int bestScore;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.xpEarned,
    required this.bestScore,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = score / totalQuestions;

    String title;
    String emoji;

    if (percentage == 1) {
      title = "Perfect!";
      emoji = "🏆";
    } else if (percentage >= 0.8) {
      title = "Excellent!";
      emoji = "🎉";
    } else if (percentage >= 0.6) {
      title = "Great Job!";
      emoji = "👏";
    } else if (percentage >= 0.4) {
      title = "Keep Practicing!";
      emoji = "💪";
    } else {
      title = "Don't Give Up!";
      emoji = "🌸";
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F8),

      appBar: AppBar(
        title: const Text("Quiz Result"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const SizedBox(height: 30),

              Text(
                emoji,
                style: const TextStyle(fontSize: 80),
              ),

              const SizedBox(height: 20),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(25),

                  child: Column(
                    children: [

                      ListTile(
                        leading: const Icon(
                          Icons.quiz,
                          color: Colors.pink,
                        ),
                        title: const Text("Score"),
                        trailing: Text(
                          "$score / $totalQuestions",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const Divider(),

                      ListTile(
                        leading: const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        title: const Text("XP Earned"),
                        trailing: Text(
                          "+$xpEarned XP",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const Divider(),

                      ListTile(
                        leading: const Icon(
                          Icons.emoji_events,
                          color: Colors.orange,
                        ),
                        title: const Text("Best Score"),
                        trailing: Text(
                          "$bestScore",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: FilledButton.icon(
                  onPressed: () {
  Navigator.pop(context, true);
},

                  icon: const Icon(Icons.refresh),

                  label: const Text(
                    "Play Again",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.popUntil(
                      context,
                      (route) => route.isFirst,
                    );
                  },

                  icon: const Icon(Icons.home),

                  label: const Text(
                    "Go Home",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}