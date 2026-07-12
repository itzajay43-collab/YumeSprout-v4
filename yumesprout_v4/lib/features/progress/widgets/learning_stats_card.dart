import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/progress_model.dart';

class LearningStatsCard extends StatelessWidget {
  final ProgressModel progress;

  const LearningStatsCard({
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
                Icons.menu_book_rounded,
                color: AppColors.primary,
                size: 28,
              ),
              SizedBox(width: 10),
              Text(
                "Learning Progress",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          _ProgressTile(
            title: "Hiragana",
            subtitle: "あ",
            completed: progress.hiraganaCompleted,
            total: progress.hiraganaTotal,
            color: Colors.purple,
          ),

          const SizedBox(height: 18),

          _ProgressTile(
            title: "Katakana",
            subtitle: "ア",
            completed: progress.katakanaCompleted,
            total: progress.katakanaTotal,
            color: Colors.blue,
          ),

          const SizedBox(height: 18),

          _ProgressTile(
            title: "Kanji",
            subtitle: "漢",
            completed: progress.kanjiCompleted,
            total: progress.kanjiTotal,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class _ProgressTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final int completed;
  final int total;
  final Color color;

  const _ProgressTile({
    required this.title,
    required this.subtitle,
    required this.completed,
    required this.total,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final progress = completed / total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            Text(
              "$completed / $total",
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
      ],
    );
  }
}