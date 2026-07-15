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

      characters: [
        CharacterItem(
          character: "あ",
          romaji: "a",
          pronunciation: "a",
          example: "あさ",
          meaning: "Morning",
          memoryTip: "Looks like an apple 🍎",
        ),
        CharacterItem(
          character: "い",
          romaji: "i",
          pronunciation: "ee",
          example: "いぬ",
          meaning: "Dog",
          memoryTip: "Looks like two standing people.",
        ),
        CharacterItem(
          character: "う",
          romaji: "u",
          pronunciation: "oo",
          example: "うみ",
          meaning: "Sea",
          memoryTip: "Imagine a smiling face.",
        ),
        CharacterItem(
          character: "え",
          romaji: "e",
          pronunciation: "eh",
          example: "えき",
          meaning: "Station",
          memoryTip: "Looks like someone exercising.",
        ),
        CharacterItem(
          character: "お",
          romaji: "o",
          pronunciation: "oh",
          example: "おちゃ",
          meaning: "Tea",
          memoryTip: "Imagine someone saying 'Oh!'",
        ),
      ],
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