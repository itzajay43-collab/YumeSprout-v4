import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_progress.dart';

import '../models/lesson_model.dart';

class LessonCard extends StatelessWidget {
  final LessonModel lesson;
  final VoidCallback onTap;

  const LessonCard({
    super.key,
    required this.lesson,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: lesson.isLocked ? .55 : 1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: lesson.isLocked ? null : onTap,
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
                // Japanese Character
                Hero(
                  tag: lesson.id,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColors.progressBackground,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Text(
                        lesson.japanese,
                        style: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lesson.title,
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        lesson.subtitle,
                        style: AppTextStyles.caption,
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${lesson.xp} XP",
                            style: AppTextStyles.caption,
                          ),

                          const SizedBox(width: 18),

                          const Icon(
                            Icons.schedule_rounded,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${lesson.duration} min",
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      AppProgress(
                        value: lesson.progress,
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: lesson.isLocked
                      ? const Icon(
                          Icons.lock_rounded,
                          key: ValueKey("lock"),
                          color: Colors.grey,
                        )
                      : lesson.isCompleted
                          ? const Icon(
                              Icons.check_circle,
                              key: ValueKey("done"),
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.arrow_forward_ios_rounded,
                              key: ValueKey("next"),
                              color: AppColors.primary,
                              size: 20,
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}