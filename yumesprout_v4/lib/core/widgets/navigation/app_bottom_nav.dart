import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      height: 72,
      backgroundColor: Colors.white,
      elevation: 4,
      indicatorColor: AppColors.primary.withValues(alpha: 0.12),

      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

      destinations: const [
        NavigationDestination(
          icon: Icon(AppIcons.home),
          selectedIcon: Icon(
            AppIcons.home,
            color: AppColors.primary,
          ),
          label: "Home",
        ),

        NavigationDestination(
          icon: Icon(AppIcons.learn),
          selectedIcon: Icon(
            AppIcons.learn,
            color: AppColors.primary,
          ),
          label: "Learn",
        ),

        NavigationDestination(
          icon: Icon(AppIcons.practice),
          selectedIcon: Icon(
            AppIcons.practice,
            color: AppColors.primary,
          ),
          label: "Practice",
        ),

        NavigationDestination(
          icon: Icon(AppIcons.progress),
          selectedIcon: Icon(
            AppIcons.progress,
            color: AppColors.primary,
          ),
          label: "Progress",
        ),

        NavigationDestination(
          icon: Icon(AppIcons.profile),
          selectedIcon: Icon(
            AppIcons.profile,
            color: AppColors.primary,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}