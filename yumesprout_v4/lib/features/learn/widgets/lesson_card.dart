import 'package:flutter/material.dart';

import '../../../core/widgets/app_card.dart';
import '../models/lesson_model.dart';
import 'lesson_card_center.dart';
import 'lesson_card_footer.dart';
import 'lesson_card_header.dart';

class LessonCard extends StatelessWidget {
  final LessonModel lesson;
  final VoidCallback? onTap;

  const LessonCard({
    super.key,
    required this.lesson,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LessonCardHeader(
            lesson: lesson,
          ),

          const SizedBox(height: 24),

          LessonCardCenter(
            lesson: lesson,
          ),

          const SizedBox(height: 24),

          const LessonCardFooter(),
        ],
      ),
    );
  }
}