import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/navigation/app_bottom_nav.dart';

import '../widgets/continue_learning_card.dart';
import '../widgets/home_header.dart';
import '../widgets/streak_card.dart';
import '../widgets/todays_word_card.dart';
import '../widgets/weekly_challenge_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: const [
            HomeHeader(
              greeting: "Konbanwa",
              userName: "Ajay",
              streak: 7,
            ),

            SizedBox(height: AppSpacing.lg),

            StreakCard(),

            SizedBox(height: AppSpacing.lg),

            ContinueLearningCard(),

            SizedBox(height: AppSpacing.lg),

            TodaysWordCard(),

            SizedBox(height: AppSpacing.lg),

            WeeklyChallengeCard(),

            SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),

      bottomNavigationBar: AppBottomNav(
        currentIndex: 0,
        onTap: (index) {
          // TODO: Add navigation in next sprint
        },
      ),
    );
  }
}