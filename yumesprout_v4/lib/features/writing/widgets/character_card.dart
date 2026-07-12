import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_text_styles.dart';

import '../controllers/writing_controller.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<WritingController>();
    final character = controller.currentCharacter;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          AppShadows.soft,
        ],
      ),
      child: Column(
        children: [
          // Character
          Text(
            character.character,
            style: const TextStyle(
              fontSize: 96,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 12),

          // Romaji
          Text(
            character.romaji.toUpperCase(),
            style: AppTextStyles.heading,
          ),

          const SizedBox(height: 8),

          // Meaning
          Text(
            "Meaning: ${character.meaning}",
            style: AppTextStyles.subtitle,
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _InfoChip(
                icon: Icons.edit_rounded,
                label: "${character.strokeCount} Strokes",
              ),
              _InfoChip(
                icon: Icons.star_rounded,
                label: "+${character.xp} XP",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.progressBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 18,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyles.body,
          ),
        ],
      ),
    );
  }
}