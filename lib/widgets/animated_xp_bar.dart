import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';

class AnimatedXPBar extends StatelessWidget {
  final double progress;
  final String label;

  const AnimatedXPBar({
    super.key,
    required this.progress,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 8),

        ClipRRect(
          borderRadius: AppRadius.pill,
          child: TweenAnimationBuilder<double>(
            tween: Tween(
              begin: 0,
              end: progress,
            ),
            duration: const Duration(milliseconds: 700),

            builder: (context, value, child) {
              return LinearProgressIndicator(
                value: value,
                minHeight: 10,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation(
                  AppColors.primary,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}