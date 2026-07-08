import 'package:flutter/material.dart';

class AppBadge extends StatelessWidget {
  final String text;
  final Color color;

  const AppBadge({
    super.key,
    required this.text,
    this.color = const Color(0xFF6C4DFF),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}