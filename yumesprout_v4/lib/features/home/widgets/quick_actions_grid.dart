import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import 'quick_action_item.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "⚡ Quick Actions",
          style: AppTextStyles.title,
        ),

        const SizedBox(height: AppSpacing.md),

        Row(
          children: [
            Expanded(
              child: QuickActionItem(
                icon: Icons.menu_book_rounded,
                title: "Vocabulary",
                subtitle: "Learn new words",
                onTap: () {
                  // TODO: Navigate to Vocabulary Screen
                },
              ),
            ),

            const SizedBox(width: AppSpacing.md),

            Expanded(
              child: QuickActionItem(
                icon: Icons.edit_rounded,
                title: "Writing",
                subtitle: "Practice writing",
                onTap: () {
                  // TODO: Navigate to Writing Screen
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.md),

        Row(
          children: [
            Expanded(
              child: QuickActionItem(
                icon: Icons.quiz_rounded,
                title: "Quiz",
                subtitle: "Test yourself",
                onTap: () {
                  // TODO: Navigate to Quiz Screen
                },
              ),
            ),

            const SizedBox(width: AppSpacing.md),

            Expanded(
              child: QuickActionItem(
                icon: Icons.smart_toy_rounded,
                title: "AI Tutor",
                subtitle: "Ask anything",
                onTap: () {
                  // TODO: Navigate to AI Tutor
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}