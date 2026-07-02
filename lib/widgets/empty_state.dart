import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class EmptyState extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;

  const EmptyState({
    super.key,
    required this.emoji,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            emoji,
            style: const TextStyle(fontSize: 60),
          ),

          const SizedBox(height: 20),

          Text(
            title,
            style: AppTextStyles.title,
          ),

          const SizedBox(height: 8),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitle,
          ),
        ],
      ),
    );
  }
}