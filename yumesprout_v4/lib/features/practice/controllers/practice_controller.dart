import 'package:flutter/material.dart';

import '../models/practice_item_model.dart';

class PracticeController extends ChangeNotifier {
  final List<PracticeItemModel> activities = const [
    PracticeItemModel(
      id: "writing",
      title: "Hiragana Writing",
      subtitle: "Practice stroke order",
      emoji: "✍️",
      xp: 20,
      duration: 5,
      isLocked: false,
      isCompleted: false,
    ),

    PracticeItemModel(
      id: "quiz",
      title: "Daily Quiz",
      subtitle: "Test today's lesson",
      emoji: "📝",
      xp: 25,
      duration: 5,
      isLocked: false,
      isCompleted: false,
    ),

    PracticeItemModel(
      id: "listening",
      title: "Listening",
      subtitle: "Native Japanese audio",
      emoji: "🎧",
      xp: 30,
      duration: 7,
      isLocked: false,
      isCompleted: false,
    ),

    PracticeItemModel(
      id: "speaking",
      title: "Speaking",
      subtitle: "Improve pronunciation",
      emoji: "🎤",
      xp: 35,
      duration: 8,
      isLocked: true,
      isCompleted: false,
    ),

    PracticeItemModel(
      id: "flashcards",
      title: "Flashcards",
      subtitle: "Quick memory practice",
      emoji: "🃏",
      xp: 15,
      duration: 4,
      isLocked: false,
      isCompleted: false,
    ),

    PracticeItemModel(
      id: "challenge",
      title: "Daily Challenge",
      subtitle: "Earn bonus XP",
      emoji: "🏆",
      xp: 50,
      duration: 10,
      isLocked: true,
      isCompleted: false,
    ),
  ];

  // Daily Goal
  final int completedToday = 2;
  final int dailyGoal = 5;

  double get dailyProgress => completedToday / dailyGoal;
}