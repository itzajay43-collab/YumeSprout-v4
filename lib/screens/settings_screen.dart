import 'package:provider/provider.dart';
import '../services/theme_service.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Widget settingTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.pink.shade50,
          child: Icon(
            icon,
            color: Colors.pink,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing:
            trailing ??
            const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            Consumer<ThemeService>(
  builder: (context, themeService, child) {
    return settingTile(
      icon: Icons.dark_mode,
      title: "Dark Mode",
      onTap: () {
        themeService.toggleTheme(!themeService.isDark);
      },
      trailing: Switch(
        value: themeService.isDark,
        onChanged: (value) {
          themeService.toggleTheme(value);
        },
      ),
    );
  },
),

            settingTile(
              icon: Icons.volume_up,
              title: "Sound",
              onTap: () {},
            ),

            settingTile(
              icon: Icons.language,
              title: "Language",
              onTap: () {},
            ),

            settingTile(
              icon: Icons.star_rate,
              title: "Rate App",
              onTap: () {},
            ),

            settingTile(
              icon: Icons.share,
              title: "Share App",
              onTap: () {},
            ),

            settingTile(
              icon: Icons.info,
              title: "About",
              onTap: () {},
            ),

            const SizedBox(height: 30),

            const Center(
              child: Text(
                "YumeSprout v0.4",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}