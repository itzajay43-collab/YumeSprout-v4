import 'package:flutter/material.dart';
import '../models/garden_stage.dart';

class GardenTree extends StatelessWidget {
  final GardenStage stage;

  const GardenTree({
    super.key,
    required this.stage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: Text(
            stage.emoji,
            key: ValueKey(stage.level),
            style: const TextStyle(
              fontSize: 72,
            ),
          ),
        ),

        const SizedBox(height: 12),

        Text(
          stage.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    );
  }
}