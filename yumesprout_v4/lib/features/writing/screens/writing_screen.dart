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
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Hiragana Writing",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [

            // ================= PROGRESS =================

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: controller.progress,
                minHeight: 10,
              ),
            ),

            const SizedBox(height: 12),

            Center(
              child: Text(
                "Character ${controller.currentIndex + 1} of ${controller.characters.length}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // ================= CHARACTER =================

            const CharacterCard(),

            const SizedBox(height: AppSpacing.lg),

            // ================= CANVAS =================

            const DrawingCanvas(),

            const SizedBox(height: 20),

            // ================= TOOLBAR =================

            WritingToolbar(
              onClear: () {
                controller.clearCanvas();
              },

              onUndo: () {
                controller.undo();
              },

              onHint: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Hint feature coming soon 💡",
                    ),
                  ),
                );
              },

              onCheck: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Accuracy Checker coming soon ✅",
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 28),

            // ================= XP =================

            Card(
              elevation: 0,
              color: Colors.amber.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    const Icon(
                      Icons.stars_rounded,
                      color: Colors.amber,
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        "Complete this character to earn ${controller.currentCharacter.xp} XP",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}