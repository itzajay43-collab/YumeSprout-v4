import 'package:flutter/material.dart';

import 'canvas/guide_grid_painter.dart';
import 'canvas/stroke_painter.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({super.key});

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  final List<Offset?> points = [];

  final GlobalKey _canvasKey = GlobalKey();

  void _addPoint(Offset globalPosition) {
    final RenderBox box =
        _canvasKey.currentContext!.findRenderObject() as RenderBox;

    final Offset localPosition = box.globalToLocal(globalPosition);

    setState(() {
      points.add(localPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onPanStart: (details) {
        _addPoint(details.globalPosition);
      },

      onPanUpdate: (details) {
        _addPoint(details.globalPosition);
      },

      onPanEnd: (_) {
        setState(() {
          points.add(null);
        });
      },

      child: Container(
        key: _canvasKey,
        height: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: CustomPaint(
            painter: const GuideGridPainter(),
            foregroundPainter: StrokePainter(
              points: points,
            ),
            child: const SizedBox.expand(),
          ),
        ),
      ),
    );
  }
}