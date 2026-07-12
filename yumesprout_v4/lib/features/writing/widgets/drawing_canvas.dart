import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/writing_controller.dart';

import 'canvas/guide_grid_painter.dart';
import 'canvas/ghost_character_painter.dart';
import 'canvas/stroke_painter.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({super.key});

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  final GlobalKey _canvasKey = GlobalKey();

  void _addPoint(
    WritingController controller,
    Offset globalPosition,
  ) {
    final RenderBox box =
        _canvasKey.currentContext!.findRenderObject() as RenderBox;

    final Offset localPosition =
        box.globalToLocal(globalPosition);

    controller.addPoint(localPosition);
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<WritingController>();

    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onPanStart: (details) {
        _addPoint(
          controller,
          details.globalPosition,
        );
      },

      onPanUpdate: (details) {
        _addPoint(
          controller,
          details.globalPosition,
        );
      },

      onPanEnd: (_) {
        controller.endStroke();
      },

      child: Container(
        key: _canvasKey,
        height: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFFE5E7EB),
            width: 1.2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x08000000),
              blurRadius: 18,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
  borderRadius: BorderRadius.circular(24),
  child: Stack(
    children: [
      // Guide Grid
      const Positioned.fill(
        child: CustomPaint(
          painter: GuideGridPainter(),
        ),
      ),

      // Ghost Character
      Positioned.fill(
        child: CustomPaint(
          painter: GhostCharacterPainter(
            character: controller.currentCharacter.character,
          ),
        ),
      ),

      // User Drawing
      Positioned.fill(
        child: CustomPaint(
          foregroundPainter: StrokePainter(
            points: controller.points,
          ),
        ),
      ),
    ],
  ),
),
      ),
    );
  }
}