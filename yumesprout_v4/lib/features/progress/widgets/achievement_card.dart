import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.emoji_events_rounded,
                color: Colors.amber,
              ),
              SizedBox(width: 10),
              Text(
                "Achievements",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: 22),

          _AchievementTile(
            icon: Icons.school,
            title: "First Lesson",
            subtitle: "Completed your first lesson",
          ),

          SizedBox(height: 14),

          _AchievementTile(
            icon: Icons.local_fire_department,
            title: "7 Day Streak",
            subtitle: "Studied for 7 consecutive days",
          ),

          SizedBox(height: 14),

          _AchievementTile(
            icon: Icons.star,
            title: "500 XP",
            subtitle: "Earned your first 500 XP",
          ),
        ],
      ),
    );
  }
}

class _AchievementTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _AchievementTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Color(0xFFFFF4CC),
        child: Icon(
          icon,
          color: Colors.amber,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: Icon(
        Icons.check_circle,
        color: Colors.green,
      ),
    );
  }
}