import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

import '../controllers/writing_controller.dart';

import '../widgets/character_card.dart';
import '../widgets/drawing_canvas.dart';
import '../widgets/writing_toolbar.dart';

class WritingScreen extends StatelessWidget {
  const WritingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WritingController(),
      child: const _WritingView(),
    );
  }
}

class _WritingView extends StatelessWidget {
  const _WritingView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<WritingController>();

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        title: const Text("Hiragana Writing"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          // Progress
          LinearProgressIndicator(
            value: controller.progress,
            borderRadius: BorderRadius.circular(20),
          ),

          const SizedBox(height: AppSpacing.lg),

          Text(
            "Character ${controller.currentIndex + 1} / ${controller.characters.length}",
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppSpacing.lg),

          const CharacterCard(),

          const SizedBox(height: AppSpacing.lg),

          const DrawingCanvas(),

          const SizedBox(height: AppSpacing.lg),

          WritingToolbar(
            onClear: () {
              // TODO
            },
            onUndo: () {
              // TODO
            },
            onHint: () {
              // TODO
            },
            onCheck: () {
              // TODO
            },
          ),

          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }
}