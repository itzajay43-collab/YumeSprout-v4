import 'package:flutter/material.dart';

import '../models/writing_character_model.dart';

class WritingController extends ChangeNotifier {
  // ================= CHARACTERS =================

  final List<WritingCharacterModel> characters = const [
    WritingCharacterModel(
      id: "hira_01",
      character: "あ",
      romaji: "a",
      meaning: "A",
      strokeCount: 3,
      order: 1,
      completed: false,
      unlocked: true,
      xp: 20,
    ),
    WritingCharacterModel(
      id: "hira_02",
      character: "い",
      romaji: "i",
      meaning: "I",
      strokeCount: 2,
      order: 2,
      completed: false,
      unlocked: true,
      xp: 20,
    ),
    WritingCharacterModel(
      id: "hira_03",
      character: "う",
      romaji: "u",
      meaning: "U",
      strokeCount: 2,
      order: 3,
      completed: false,
      unlocked: true,
      xp: 20,
    ),
    WritingCharacterModel(
      id: "hira_04",
      character: "え",
      romaji: "e",
      meaning: "E",
      strokeCount: 2,
      order: 4,
      completed: false,
      unlocked: false,
      xp: 20,
    ),
    WritingCharacterModel(
      id: "hira_05",
      character: "お",
      romaji: "o",
      meaning: "O",
      strokeCount: 3,
      order: 5,
      completed: false,
      unlocked: false,
      xp: 20,
    ),
  ];

  // ================= DRAWING =================

  final List<Offset?> points = [];

  // ================= CURRENT CHARACTER =================

  int currentIndex = 0;

  WritingCharacterModel get currentCharacter =>
      characters[currentIndex];

  double get progress =>
      (currentIndex + 1) / characters.length;

  bool get hasNext =>
      currentIndex < characters.length - 1;

  bool get hasPrevious =>
      currentIndex > 0;

  // ================= DRAW METHODS =================

  void addPoint(Offset point) {
    points.add(point);
    notifyListeners();
  }

  void endStroke() {
    points.add(null);
    notifyListeners();
  }

  void clearCanvas() {
    points.clear();
    notifyListeners();
  }

  void undo() {
    if (points.isEmpty) return;

    // Remove trailing nulls
    while (points.isNotEmpty && points.last == null) {
      points.removeLast();
    }

    // Remove last stroke
    while (points.isNotEmpty && points.last != null) {
      points.removeLast();
    }

    // Remove separator if present
    if (points.isNotEmpty && points.last == null) {
      points.removeLast();
    }

    notifyListeners();
  }

  // ================= NAVIGATION =================

  void nextCharacter() {
    if (!hasNext) return;

    currentIndex++;
    clearCanvas();
    notifyListeners();
  }

  void previousCharacter() {
    if (!hasPrevious) return;

    currentIndex--;
    clearCanvas();
    notifyListeners();
  }
}