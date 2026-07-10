import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_progress.dart';

import '../controllers/practice_controller.dart';

class DailyGoalBanner extends StatelessWidget {
  const DailyGoalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PracticeController>();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          AppShadows.soft,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                "🔥",
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(width: 10),
              Text(
                "Daily Goal",
                style: AppTextStyles.title,
              ),
            ],
          ),

          const SizedBox(height: 20),

          AppProgress(
            value: controller.dailyProgress,
          ),

          const SizedBox(height: 10),

          Text(
            "${controller.completedToday} / ${controller.dailyGoal} Activities Completed",
            style: AppTextStyles.subtitle,
          ),

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: AppColors.progressBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.workspace_premium_rounded,
                  color: Colors.amber,
                ),
                SizedBox(width: 8),
                Text(
                  "Complete today's goal to earn +50 XP",
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}