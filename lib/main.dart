import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/bottom_nav_screen.dart';
import 'services/theme_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeService(),
      child: const YumeSproutApp(),
    ),
  );
}

class YumeSproutApp extends StatelessWidget {
  const YumeSproutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'YumeSprout',

          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.pink,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),

          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.pink,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),

          themeMode: themeService.themeMode,

          home: const BottomNavScreen(),
        );
      },
    );
  }
}