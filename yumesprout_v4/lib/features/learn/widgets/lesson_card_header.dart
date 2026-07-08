import 'package:flutter/material.dart';

import '../../../core/widgets/app_badge.dart';
import '../models/lesson_model.dart';
import 'lesson_xp_badge.dart';

class LessonCardHeader extends StatelessWidget {
  final LessonModel lesson;

  const LessonCardHeader({
    super.key,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppBadge(
          text: "Hiragana Basics",
        ),

        const Spacer(),

        LessonXpBadge(
          xp: lesson.xp,
        ),
      ],
    );
  }
}