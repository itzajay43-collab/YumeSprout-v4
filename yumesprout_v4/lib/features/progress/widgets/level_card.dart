import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/progress_model.dart';

class LevelCard extends StatelessWidget {
  final ProgressModel progress;

  const LevelCard({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.workspace_premium_rounded,
                color: Colors.amber,
                size: 28,
              ),
              SizedBox(width: 10),
              Text(
                "Level Progress",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Center(
            child: CircleAvatar(
              radius: 42,
              backgroundColor: Colors.amber.shade100,
              child: Text(
                "${progress.level}",
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress.xpProgress,
              minHeight: 10,
            ),
          ),

          const SizedBox(height: 12),

          Center(
            child: Text(
              "${progress.currentXp} / ${progress.nextLevelXp} XP",
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}