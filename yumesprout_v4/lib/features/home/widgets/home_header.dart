import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  final String greeting;
  final String userName;
  final int streak;

  const HomeHeader({
    super.key,
    required this.greeting,
    required this.userName,
    required this.streak,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$greeting, $userName 👋",
                style: AppTextStyles.heading,
              ),

              const SizedBox(height: AppSpacing.sm),

              const Text(
                "Let's continue your Japanese journey today.",
                style: AppTextStyles.subtitle,
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: AppColors.secondary.withOpacity(0.15),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "🔥",
                style: TextStyle(fontSize: 22),
              ),

              const SizedBox(width: 8),

              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$streak",
                    style: AppTextStyles.title,
                  ),

                  const Text(
                    "Day Streak",
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}