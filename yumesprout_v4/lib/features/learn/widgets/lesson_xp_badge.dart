import 'package:flutter/material.dart';

class LessonXpBadge extends StatelessWidget {
  final int xp;

  const LessonXpBadge({
    super.key,
    required this.xp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF7B61FF),
            Color(0xFF9C6CFF),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        "+$xp XP",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}