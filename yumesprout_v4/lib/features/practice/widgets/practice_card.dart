import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_text_styles.dart';

import '../models/practice_item_model.dart';

class PracticeCard extends StatelessWidget {
  final PracticeItemModel item;
  final VoidCallback onTap;

  const PracticeCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: item.isLocked ? 0.6 : 1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: item.isLocked ? null : onTap,
          child: Ink(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                AppShadows.soft,
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.progressBackground,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Text(
                      item.emoji,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        item.subtitle,
                        style: AppTextStyles.caption,
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Text(
                            "⭐ ${item.xp} XP",
                            style: AppTextStyles.caption,
                          ),

                          const SizedBox(width: 16),

                          Text(
                            "⏱ ${item.duration} min",
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                Icon(
                  item.isLocked
                      ? Icons.lock_rounded
                      : item.isCompleted
                          ? Icons.check_circle_rounded
                          : Icons.arrow_forward_ios_rounded,
                  color: item.isCompleted
                      ? Colors.green
                      : AppColors.primary,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}