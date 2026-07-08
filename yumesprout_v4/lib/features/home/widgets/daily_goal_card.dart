import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';

class DailyGoalCard extends StatelessWidget {
  final int currentXP;
  final int goalXP;

  const DailyGoalCard({
    super.key,
    required this.currentXP,
    required this.goalXP,
  });

  @override
  Widget build(BuildContext context) {
    final progress = currentXP / goalXP;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 8,
              backgroundColor: AppColors.border,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(width: AppSpacing.lg),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Daily Goal",
                  style: AppTextStyles.title,
                ),

                const SizedBox(height: AppSpacing.xs),

                Text(
                  "$currentXP / $goalXP XP",
                  style: AppTextStyles.subtitle,
                ),

                const SizedBox(height: AppSpacing.xs),

                Text(
                  "${(progress * 100).toInt()}% Completed",
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}