import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class JlptTabs extends StatelessWidget {
  final String selectedLevel;
  final ValueChanged<String> onChanged;

  const JlptTabs({
    super.key,
    required this.selectedLevel,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const levels = ["N5", "N4", "N3", "N2", "N1"];

    return SizedBox(
      height: 46,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: levels.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final level = levels[index];
          final selected = level == selectedLevel;

          return GestureDetector(
            onTap: () => onChanged(level),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.primary
                    : AppColors.card,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: selected
                      ? AppColors.primary
                      : AppColors.border,
                ),
              ),
              child: Center(
                child: Text(
                  level,
                  style: selected
                      ? AppTextStyles.body.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )
                      : AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}