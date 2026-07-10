import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

import '../controllers/practice_controller.dart';

import '../widgets/daily_goal_banner.dart';
import '../widgets/practice_card.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PracticeController(),
      child: const _PracticeView(),
    );
  }
}

class _PracticeView extends StatelessWidget {
  const _PracticeView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PracticeController>();

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("Practice"),
        centerTitle: false,
      ),

      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const DailyGoalBanner(),

          const SizedBox(height: AppSpacing.lg),

          ...controller.activities.map(
            (activity) => Padding(
              padding: const EdgeInsets.only(
                bottom: AppSpacing.md,
              ),
              child: PracticeCard(
                item: activity,
                onTap: () {
                  // TODO:
                  // Open Practice Module
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}