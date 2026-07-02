import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import 'animated_xp_bar.dart';

class HomeBannerV2 extends StatelessWidget {
  final String userName;
  final int level;
  final String levelName;
  final int streak;
  final int xp;
  final int currentXP;

  const HomeBannerV2({
    super.key,
    required this.userName,
    required this.level,
    required this.levelName,
    required this.streak,
    required this.xp,
    required this.currentXP,
  });

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "🌅 Good Morning";
    } else if (hour < 17) {
      return "☀️ Good Afternoon";
    } else if (hour < 21) {
      return "🌇 Good Evening";
    } else {
      return "🌙 Good Night";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: AppRadius.xl,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(.18),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            getGreeting(),
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Welcome back, $userName 👋",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "$levelName • Level $level",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 25),

          Row(
            children: [

              const Icon(
                Icons.local_fire_department,
                color: Colors.orange,
              ),

              const SizedBox(width: 6),

              Text(
                "$streak Day Streak",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              Text(
                "⭐ $xp XP",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          AnimatedXPBar(
            progress: currentXP / 100,
            label: "$currentXP / 100 XP",
          ),

          const SizedBox(height: 18),

          const Divider(
            color: Colors.white24,
          ),

          const SizedBox(height: 10),

          const Text(
            "🌸 One step closer to Japan.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}