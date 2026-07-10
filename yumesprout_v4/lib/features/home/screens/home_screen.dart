import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

import '../controllers/home_controller.dart';

import '../widgets/hero_learning_card.dart';
import '../widgets/home_header.dart';
import '../widgets/quick_actions_grid.dart';
import '../widgets/todays_word_card.dart';
import '../widgets/weekly_challenge_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final home = context.watch<HomeController>().home;

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            // ================= HEADER =================

            HomeHeader(
              greeting: home.greeting,
              userName: home.userName,
              streak: home.streak,
            ),

            const SizedBox(height: AppSpacing.lg),

            // ================= HERO =================

            const HeroLearningCard(),

            const SizedBox(height: AppSpacing.lg),

            // ================= QUICK ACTIONS =================

            const QuickActionsGrid(),

            const SizedBox(height: AppSpacing.lg),

            // ================= TODAY'S WORD =================

            const TodaysWordCard(),

            const SizedBox(height: AppSpacing.lg),

            // ================= WEEKLY CHALLENGE =================

            const WeeklyChallengeCard(),

            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}