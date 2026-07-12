import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

import '../controllers/profile_controller.dart';

import '../widgets/profile_header.dart';
import '../widgets/japanese_name_card.dart';
import '../widgets/profile_stats_card.dart';
import '../widgets/garden_preview_card.dart';
import '../widgets/passport_preview_card.dart';
import '../widgets/settings_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileController(),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProfileController>();

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Profile",
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

            ProfileHeader(
              profile: controller.profile,
            ),

            const SizedBox(height: AppSpacing.lg),

            JapaneseNameCard(
              profile: controller.profile,
            ),

            const SizedBox(height: AppSpacing.lg),

            ProfileStatsCard(
              profile: controller.profile,
            ),

            const SizedBox(height: AppSpacing.lg),

            GardenPreviewCard(
              profile: controller.profile,
            ),

            const SizedBox(height: AppSpacing.lg),

            PassportPreviewCard(
              profile: controller.profile,
            ),

            const SizedBox(height: AppSpacing.lg),

            const SettingsCard(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}