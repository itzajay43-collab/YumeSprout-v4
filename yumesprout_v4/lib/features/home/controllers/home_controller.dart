import 'package:flutter/material.dart';

import '../models/home_model.dart';

class HomeController extends ChangeNotifier {
  HomeModel _home = const HomeModel(
    userName: "Ajay",
    streak: 7,
    level: 3,
    xp: 420,
    lessonProgress: 0.68,
  );

  HomeModel get home => _home;

  String get greeting {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Ohayou";
    } else if (hour < 17) {
      return "Konnichiwa";
    } else {
      return "Konbanwa";
    }
  }

  void updateProgress(double progress) {
    _home = _home.copyWith(
      lessonProgress: progress,
    );

    notifyListeners();
  }

  void addXP(int value) {
    _home = _home.copyWith(
      xp: _home.xp + value,
    );

    notifyListeners();
  }

  void updateStreak(int streak) {
    _home = _home.copyWith(
      streak: streak,
    );

    notifyListeners();
  }
}