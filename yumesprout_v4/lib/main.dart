import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import 'core/theme/app_theme.dart';

import 'features/auth/controllers/auth_controller.dart';
import 'features/progress/controllers/progress_controller.dart';
import 'features/splash/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const YumeSproutApp());
}

class YumeSproutApp extends StatelessWidget {
  const YumeSproutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),

        ChangeNotifierProvider(
          create: (_) => ProgressController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'YumeSprout',
        theme: AppTheme.light,
        home: const SplashScreen(),
      ),
    );
  }
}