import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../models/lesson_model.dart';

class LessonCardCenter extends StatelessWidget {
  final LessonModel lesson;

  const LessonCardCenter({
    super.key,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          lesson.character,
          style: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: AppSpacing.sm),

        Text(
          lesson.romaji.toUpperCase(),
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          "${lesson.englishMeaning} • ${lesson.hindiMeaning}",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}