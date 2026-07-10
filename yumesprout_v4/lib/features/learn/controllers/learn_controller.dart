import 'package:flutter/material.dart';

import '../models/lesson_model.dart';

class LearnController extends ChangeNotifier {
  final List<LessonModel> lessons = const [
    LessonModel(
      id: "hiragana_1",
      title: "Hiragana Basics",
      subtitle: "Learn あいうえお",
      japanese: "あ",
      level: "N5",
      xp: 20,
      duration: 5,
      progress: 0.30,
      isLocked: false,
      isCompleted: false,
    ),

    LessonModel(
      id: "katakana_1",
      title: "Katakana Basics",
      subtitle: "Learn アイウエオ",
      japanese: "ア",
      level: "N5",
      xp: 20,
      duration: 5,
      progress: 0.00,
      isLocked: true,
      isCompleted: false,
    ),

    LessonModel(
      id: "kanji_1",
      title: "Basic Kanji",
      subtitle: "First 10 Kanji",
      japanese: "日",
      level: "N5",
      xp: 30,
      duration: 8,
      progress: 0.00,
      isLocked: true,
      isCompleted: false,
    ),

    LessonModel(
      id: "greetings",
      title: "Daily Greetings",
      subtitle: "こんにちは・おはよう",
      japanese: "👋",
      level: "N5",
      xp: 15,
      duration: 4,
      progress: 0.80,
      isLocked: false,
      isCompleted: false,
    ),

    LessonModel(
      id: "numbers",
      title: "Numbers",
      subtitle: "1〜100",
      japanese: "🔢",
      level: "N5",
      xp: 15,
      duration: 4,
      progress: 1.00,
      isLocked: false,
      isCompleted: true,
    ),

    LessonModel(
      id: "conversation",
      title: "Basic Conversation",
      subtitle: "Simple daily talks",
      japanese: "💬",
      level: "N5",
      xp: 40,
      duration: 10,
      progress: 0.00,
      isLocked: true,
      isCompleted: false,
    ),
  ];
}