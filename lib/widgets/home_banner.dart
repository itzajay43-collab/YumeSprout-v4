import 'package:flutter/material.dart';
import '../services/progress_service.dart';
import '../services/streak_service.dart';
import '../services/xp_service.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  Future<Map<String, dynamic>> getData() async {
  final progress = await ProgressService().getHiraganaProgress();
  final streak = await StreakService().getStreak();
  final best = await StreakService().getBestStreak();
  final xp = await XpService().getXP();

  return {
  "progress": progress,
  "streak": streak,
  "best": best,
  "xp": xp,
};
}

  @override
  Widget build(BuildContext context) {
  return FutureBuilder<Map<String, dynamic>>(
  future: getData(),
      builder: (context, snapshot) {
        final progress = snapshot.data?["progress"] ?? 0;
final streak = snapshot.data?["streak"] ?? 1;
final best = snapshot.data?["best"] ?? 1;
final xp = snapshot.data?["xp"] ?? 0;
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffEC407A),
                Color(0xffF48FB1),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withOpacity(.30),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "🌸 Welcome Back",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 17,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "YumeSprout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

const Text(
  "Learn Japanese Every Day 🇯🇵",
  style: TextStyle(
    color: Colors.white,
    fontSize: 15,
  ),
),

const SizedBox(height: 18),

Row(
  children: [
    const Icon(
      Icons.local_fire_department,
      color: Colors.orange,
      size: 22,
    ),
    const SizedBox(width: 6),
    Text(
      "$streak Day Streak",
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ],
),

const SizedBox(height: 4),

Text(
  "🏆 Best: $best Days",
  style: const TextStyle(
    color: Colors.white70,
    fontSize: 13,
  ),
),
const SizedBox(height: 8),

Text(
  "⭐ XP: $xp",
  style: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  ),
),

const SizedBox(height: 20),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: progress / 46,
                        minHeight: 8,
                        backgroundColor: Colors.white24,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "$progress / 46 Characters Completed",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 15),

              Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.20),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    "🌸",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}