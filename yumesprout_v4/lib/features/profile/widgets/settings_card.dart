import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: const [
          _SettingTile(
            icon: Icons.notifications_outlined,
            title: "Notifications",
          ),
          Divider(height: 1),
          _SettingTile(
            icon: Icons.palette_outlined,
            title: "Theme",
          ),
          Divider(height: 1),
          _SettingTile(
            icon: Icons.language_outlined,
            title: "Language",
          ),
          Divider(height: 1),
          _SettingTile(
            icon: Icons.info_outline_rounded,
            title: "About YumeSprout",
          ),
        ],
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SettingTile({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.primary,
      ),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {},
    );
  }
}