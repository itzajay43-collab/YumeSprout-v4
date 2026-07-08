import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';

class LessonCharacter extends StatelessWidget {
  final String character;

  const LessonCharacter({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: AppColors.characterBackground,
        borderRadius: BorderRadius.circular(
          AppRadius.lg,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        character,
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }
}