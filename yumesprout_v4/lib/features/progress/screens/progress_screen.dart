import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

import '../controllers/progress_controller.dart';

import '../widgets/xp_card.dart';
import '../widgets/streak_card.dart';
import '../widgets/level_card.dart';
import '../widgets/weekly_goal_card.dart';
import '../widgets/learning_stats_card.dart';
import '../widgets/activity_calendar.dart';
import '../widgets/achievement_card.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProgressController(),
      child: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProgressController>();

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Progress",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [

            // XP
            XpCard(progress: controller.progress),

            const SizedBox(height: AppSpacing.lg),

            // Streak
            StreakCard(progress: controller.progress),

            const SizedBox(height: AppSpacing.lg),

            // Level
            LevelCard(progress: controller.progress),

            const SizedBox(height: AppSpacing.lg),

            // Weekly Goal
            WeeklyGoalCard(progress: controller.progress),

            const SizedBox(height: AppSpacing.lg),

            // Learning Progress
            LearningStatsCard(progress: controller.progress),

            const SizedBox(height: AppSpacing.lg),

            // Activity
            ActivityCalendar(progress: controller.progress),

            const SizedBox(height: AppSpacing.lg),

            // Achievements
            AchievementCard(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}