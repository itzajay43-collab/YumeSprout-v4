import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../auth/services/auth_service.dart';
import '../../auth/screens/login_screen.dart';

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
        children: [
          const _SettingTile(
            icon: Icons.notifications_outlined,
            title: "Notifications",
          ),
          const Divider(height: 1),

          const _SettingTile(
            icon: Icons.palette_outlined,
            title: "Theme",
          ),
          const Divider(height: 1),

          const _SettingTile(
            icon: Icons.language_outlined,
            title: "Language",
          ),
          const Divider(height: 1),

          const _SettingTile(
            icon: Icons.info_outline_rounded,
            title: "About YumeSprout",
          ),
          const Divider(height: 1),

          ListTile(
            leading: const Icon(
              Icons.logout_rounded,
              color: Colors.red,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(
              Icons.chevron_right_rounded,
            ),
            onTap: () async {
              final logout = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Logout"),
                  content: const Text(
                    "Are you sure you want to logout?",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text("Cancel"),
                    ),
                    FilledButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text("Logout"),
                    ),
                  ],
                ),
              );

              if (logout != true || !context.mounted) return;

              await AuthService.instance.signOut();

              if (!context.mounted) return;

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (_) => const LoginScreen(),
                ),
                (route) => false,
              );
            },
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
      trailing: const Icon(
        Icons.chevron_right_rounded,
      ),
      onTap: () {},
    );
  }
}