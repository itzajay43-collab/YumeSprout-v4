import 'dart:math' as math;
import 'package:flutter/material.dart';

class GuideGridPainter extends CustomPainter {
  const GuideGridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..color = const Color(0xFFE5E7EB)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final guidePaint = Paint()
      ..color = const Color(0xFFD1D5DB)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Border
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Offset.zero & size,
        const Radius.circular(24),
      ),
      borderPaint,
    );

    // Vertical Center Line
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      guidePaint,
    );

    // Horizontal Center Line
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      guidePaint,
    );

    // Diagonal ↘
    _drawDashedLine(
      canvas,
      const Offset(0, 0),
      Offset(size.width, size.height),
      guidePaint,
    );

    // Diagonal ↙
    _drawDashedLine(
      canvas,
      Offset(size.width, 0),
      Offset(0, size.height),
      guidePaint,
    );

    // Center Dot
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      3,
      Paint()..color = const Color(0xFFD1D5DB),
    );
  }

  void _drawDashedLine(
    Canvas canvas,
    Offset start,
    Offset end,
    Paint paint,
  ) {
    const dashWidth = 8.0;
    const dashSpace = 6.0;

    final dx = end.dx - start.dx;
    final dy = end.dy - start.dy;

    final distance = math.sqrt(dx * dx + dy * dy);

    final vx = dx / distance;
    final vy = dy / distance;

    double current = 0;

    while (current < distance) {
      final from = Offset(
        start.dx + vx * current,
        start.dy + vy * current,
      );

      final to = Offset(
        start.dx + vx * math.min(current + dashWidth, distance),
        start.dy + vy * math.min(current + dashWidth, distance),
      );

      canvas.drawLine(from, to, paint);

      current += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant GuideGridPainter oldDelegate) => false;
}