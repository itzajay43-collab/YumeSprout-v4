import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_text_styles.dart';

import '../controllers/home_controller.dart';

class HeroLearningCard extends StatelessWidget {
  const HeroLearningCard({super.key});

  @override
  Widget build(BuildContext context) {
    final home = context.watch<HomeController>().home;
    final progress = home.progress;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          AppShadows.soft,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ================= HEADER =================

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.menu_book_rounded,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Continue Learning",
                    style: AppTextStyles.title,
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.streakChip,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "🔥 Day ${home.streak}",
                  style: AppTextStyles.body,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // ================= CHARACTER =================

          Center(
            child: Text(
              home.character,
              style: const TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),

          const SizedBox(height: 18),

          // ================= LESSON =================

          Center(
            child: Text(
              home.currentLesson,
              style: AppTextStyles.heading,
            ),
          ),

          const SizedBox(height: 8),

          Center(
            child: Text(
              "Lesson 1 • ${home.currentStep} / ${home.totalSteps} Characters",
              style: AppTextStyles.subtitle,
            ),
          ),

          const SizedBox(height: 24),

          // ================= PROGRESS =================

          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 10,
                    backgroundColor: AppColors.progressBackground,
                    valueColor: const AlwaysStoppedAnimation(
                      AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "${(progress * 100).toInt()}%",
                style: AppTextStyles.body,
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ================= XP & TIME =================

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "⭐ +${home.xp} XP",
                style: AppTextStyles.body,
              ),
              const Text(
                "⏱ 3 min",
                style: AppTextStyles.subtitle,
              ),
            ],
          ),

          const SizedBox(height: 24),

          // ================= BUTTON =================

          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: Navigate to Lesson Screen
              },
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text(
                "Continue Learning",
                style: AppTextStyles.button,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}