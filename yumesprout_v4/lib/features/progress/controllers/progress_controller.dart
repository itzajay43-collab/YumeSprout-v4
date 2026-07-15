import 'package:flutter/material.dart';

import '../models/progress_model.dart';
import '../services/progress_service.dart';

class ProgressController extends ChangeNotifier {
  final ProgressService _service = ProgressService.instance;

  ProgressModel _progress = const ProgressModel(
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

  ProgressModel get progress => _progress;

  // ---------------- XP ----------------

  Future<void> addXp(int xp) async {
    int newXp = _progress.currentXp + xp;
    int level = _progress.level;
    int nextLevelXp = _progress.nextLevelXp;

    while (newXp >= nextLevelXp) {
      newXp -= nextLevelXp;
      level++;
      nextLevelXp += 500;
    }

    _progress = _progress.copyWith(
      currentXp: newXp,
      level: level,
      nextLevelXp: nextLevelXp,
    );

    notifyListeners();

    await saveProgress();
  }

  // ---------------- Lesson ----------------

  Future<void> completeLesson() async {
    _progress = _progress.copyWith(
      completedLessons: _progress.completedLessons + 1,
    );

    notifyListeners();

    await addXp(20);
  }

  // ---------------- Streak ----------------

  Future<void> increaseStreak() async {
    final streak = _progress.streak + 1;

    _progress = _progress.copyWith(
      streak: streak,
      longestStreak: streak > _progress.longestStreak
          ? streak
          : _progress.longestStreak,
    );

    notifyListeners();

    await saveProgress();
  }

  // ---------------- Weekly Goal ----------------

  Future<void> completeDailyGoal() async {
    if (_progress.weeklyCompleted >= _progress.weeklyGoal) {
      return;
    }

    _progress = _progress.copyWith(
      weeklyCompleted: _progress.weeklyCompleted + 1,
    );

    notifyListeners();

    await saveProgress();
  }

  // ---------------- Hiragana ----------------

  Future<void> completeHiragana() async {
    if (_progress.hiraganaCompleted >= _progress.hiraganaTotal) {
      return;
    }

    _progress = _progress.copyWith(
      hiraganaCompleted: _progress.hiraganaCompleted + 1,
    );

    notifyListeners();

    await saveProgress();
  }

  // ---------------- Katakana ----------------

  Future<void> completeKatakana() async {
    if (_progress.katakanaCompleted >= _progress.katakanaTotal) {
      return;
    }

    _progress = _progress.copyWith(
      katakanaCompleted: _progress.katakanaCompleted + 1,
    );

    notifyListeners();

    await saveProgress();
  }

  // ---------------- Kanji ----------------

  Future<void> completeKanji() async {
    if (_progress.kanjiCompleted >= _progress.kanjiTotal) {
      return;
    }

    _progress = _progress.copyWith(
      kanjiCompleted: _progress.kanjiCompleted + 1,
    );

    notifyListeners();

    await saveProgress();
  }

  // ---------------- Firestore ----------------

  Future<void> loadProgress() async {
    final data = await _service.getProgress();

    if (data != null) {
      _progress = data;
      notifyListeners();
    }
  }

  Future<void> saveProgress() async {
    await _service.saveProgress(_progress);
  }
}