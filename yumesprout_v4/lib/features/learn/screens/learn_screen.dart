import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

import '../controllers/learn_controller.dart';
import '../widgets/continue_learning_banner.dart';
import '../widgets/jlpt_tabs.dart';
import '../widgets/lesson_card.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LearnController(),
      child: const _LearnView(),
    );
  }
}

class _LearnView extends StatefulWidget {
  const _LearnView();

  @override
  State<_LearnView> createState() => _LearnViewState();
}

class _LearnViewState extends State<_LearnView> {
  String selectedLevel = "N5";

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LearnController>();

    final lessons = controller.lessons
        .where((lesson) => lesson.level == selectedLevel)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("Learn Japanese"),
        centerTitle: false,
      ),

      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const ContinueLearningBanner(),

          const SizedBox(height: AppSpacing.lg),

          JlptTabs(
            selectedLevel: selectedLevel,
            onChanged: (level) {
              setState(() {
                selectedLevel = level;
              });
            },
          ),

          const SizedBox(height: AppSpacing.xl),

          ...lessons.map(
            (lesson) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: LessonCard(
                lesson: lesson,
                onTap: () {
                  // TODO: Open lesson
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}