import 'package:flutter/material.dart';
import '../services/daily_goal_service.dart';

class DailyGoalCard extends StatelessWidget {
  const DailyGoalCard({super.key});

  Future<Map<String, dynamic>> getData() async {
    final service = DailyGoalService();

    final progress = await service.getProgress();
    final goal = service.getGoal();
    final completed = await service.isCompleted();

    return {
      "progress": progress,
      "goal": goal,
      "completed": completed,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getData(),
      builder: (context, snapshot) {
        final progress = snapshot.data?["progress"] ?? 0;
        final goal = snapshot.data?["goal"] ?? 5;
        final completed = snapshot.data?["completed"] ?? false;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.15),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "🎯",
                    style: TextStyle(fontSize: 26),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Today's Goal",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Text(
                completed
                    ? "Goal Completed! 🎉"
                    : "Learn $goal Characters Today",
                style: TextStyle(
                  fontSize: 16,
                  color: completed ? Colors.green : Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: progress / goal,
                  minHeight: 8,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "$progress / $goal Completed",
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}