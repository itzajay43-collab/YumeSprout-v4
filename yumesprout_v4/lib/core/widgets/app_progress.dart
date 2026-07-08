import 'package:flutter/material.dart';

class AppProgress extends StatelessWidget {
  final double value;

  const AppProgress({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: value,
        minHeight: 8,
        backgroundColor: const Color(0xFFE9E9F5),
        valueColor: const AlwaysStoppedAnimation(
          Color(0xFF6C4DFF),
        ),
      ),
    );
  }
}