import 'package:flutter/material.dart';

import '../widgets/app_scaffold.dart';
import '../widgets/premium_banner.dart';
import '../widgets/section_title.dart';
import '../widgets/animated_xp_bar.dart';
import '../theme/app_spacing.dart';

class HomeScreenV2 extends StatelessWidget {
  const HomeScreenV2({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppBar: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 20),

            const PremiumBanner(
              title: "Good Morning 🌸",
              subtitle: "今日は何を学びますか？\nWhat will you learn today?",
            ),

            const SizedBox(height: 30),

            const AnimatedXPBar(
              progress: .45,
              label: "Level 3 • Blossom",
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Today's Journey",
              subtitle: "Continue your Japanese adventure",
            ),

            const SizedBox(height: 20),

            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Daily Challenge",
              subtitle: "Earn bonus XP today",
            ),

            const SizedBox(height: 20),

            Container(
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Collection Hall",
              subtitle: "Achievements & badges",
            ),

            const SizedBox(height: 20),

            Container(
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}