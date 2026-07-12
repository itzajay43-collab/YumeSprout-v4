import 'package:flutter/material.dart';

class GhostCharacterPainter extends CustomPainter {
  final String character;

  const GhostCharacterPainter({
    required this.character,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: character,
        style: const TextStyle(
          fontSize: 180,
          fontWeight: FontWeight.bold,
          color: Color(0x22000000), // 13% opacity
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    textPainter.layout();

    final offset = Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2,
    );

    textPainter.paint(
      canvas,
      offset,
    );
  }

  @override
  bool shouldRepaint(covariant GhostCharacterPainter oldDelegate) {
    return oldDelegate.character != character;
  }
}