import 'package:flutter/material.dart';

import 'core/navigation/main_navigation.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const YumeSproutApp());
}

class YumeSproutApp extends StatelessWidget {
  const YumeSproutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YumeSprout',
      theme: AppTheme.light,
      home: const MainNavigation(),
    );
  }
}