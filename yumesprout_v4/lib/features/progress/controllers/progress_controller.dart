import 'package:flutter/material.dart';

import '../models/progress_model.dart';

class ProgressController extends ChangeNotifier {
  final ProgressModel progress = const ProgressModel(
    // XP
    currentXp: 1250,
    nextLevelXp: 1500,
    level: 4,

    // Streak
    streak: 12,
    longestStreak: 28,

    // Weekly Goal
    weeklyGoal: 7,
    weeklyCompleted: 5,

    // Hiragana
    hiraganaCompleted: 42,
    hiraganaTotal: 46,

    // Katakana
    katakanaCompleted: 18,
    katakanaTotal: 46,

    // Kanji
    kanjiCompleted: 12,
    kanjiTotal: 2136,

    // Lessons
    completedLessons: 60,
    totalLessons: 250,

    // Last 14 Days Activity
    activity: [
      true,
      true,
      true,
      false,
      true,
      true,
      false,
      true,
      true,
      true,
      true,
      false,
      true,
      true,
    ],
  );
}