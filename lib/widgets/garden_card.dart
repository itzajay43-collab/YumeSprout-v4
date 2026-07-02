import 'package:flutter/material.dart';

import '../models/garden_stage.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import 'garden_tree.dart';

class GardenCard extends StatelessWidget {
  final GardenStage stage;
  final int currentXP;
  final int nextXP;
  final VoidCallback onTap;

  const GardenCard({
    super.key,
    required this.stage,
    required this.currentXP,
    required this.nextXP,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (currentXP / nextXP).clamp(0.0, 1.0);

    return InkWell(
      borderRadius: AppRadius.large,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          borderRadius: AppRadius.large,
          gradient: const LinearGradient(
            colors: [
              Color(0xffE8F5E9),
              Color(0xffF1F8E9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(.10),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [

            Row(
              children: [

                const Icon(
                  Icons.park_rounded,
                  color: Colors.green,
                ),

                const SizedBox(width: 8),

                const Expanded(
                  child: Text(
                    "My Sakura Garden",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Lv ${stage.level}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            GardenTree(stage: stage),

            const SizedBox(height: 24),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 10,
                backgroundColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation(
                  AppColors.primary,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "$currentXP / $nextXP Growth XP",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onTap,
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Visit Garden"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}