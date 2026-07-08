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
      indicatorColor: AppColors.primary.withOpacity(0.12),
      destinations: const [
        NavigationDestination(
          icon: Icon(AppIcons.home),
          selectedIcon: Icon(AppIcons.home),
          label: "Home",
        ),
        NavigationDestination(
          icon: Icon(AppIcons.learn),
          selectedIcon: Icon(AppIcons.learn),
          label: "Learn",
        ),
        NavigationDestination(
          icon: Icon(AppIcons.practice),
          selectedIcon: Icon(AppIcons.practice),
          label: "Practice",
        ),
        NavigationDestination(
          icon: Icon(AppIcons.progress),
          selectedIcon: Icon(AppIcons.progress),
          label: "Progress",
        ),
        NavigationDestination(
          icon: Icon(AppIcons.profile),
          selectedIcon: Icon(AppIcons.profile),
          label: "Profile",
        ),
      ],
    );
  }
}