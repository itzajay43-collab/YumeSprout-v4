import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_progress.dart';

class ContinueLearningCard extends StatelessWidget {
  final VoidCallback? onPressed;

  const ContinueLearningCard({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.menu_book_rounded,
                color: AppColors.primary,
              ),
              SizedBox(width: AppSpacing.sm),
              Text(
                "Continue Learning",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.secondary,
                ],
              ),
              borderRadius: BorderRadius.circular(
                AppRadius.lg,
              ),
            ),
            child: const Column(
              children: [
                Text(
                  "あ",
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: AppSpacing.sm),

                Text(
                  "Hiragana • Lesson 1",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: AppSpacing.sm),

                Text(
                  "25% Completed",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          const AppProgress(
            value: 0.25,
          ),

          const SizedBox(height: AppSpacing.lg),

          AppButton(
            text: "Continue Learning",
            icon: Icons.play_arrow_rounded,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}