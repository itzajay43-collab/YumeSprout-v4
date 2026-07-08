import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_badge.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_progress.dart';

class LessonCardFooter extends StatelessWidget {
  const LessonCardFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            AppBadge(
              text: "Easy",
              color: AppColors.success,
            ),
            SizedBox(width: AppSpacing.sm),
            AppBadge(
              text: "JLPT N5",
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.md),

        const AppProgress(
          value: 0.25,
        ),

        const SizedBox(height: AppSpacing.md),

        AppButton(
          text: "Continue Learning",
          icon: Icons.play_arrow_rounded,
          onPressed: () {},
        ),
      ],
    );
  }
}