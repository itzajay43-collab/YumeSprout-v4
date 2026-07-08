import 'package:flutter/material.dart';

import '../models/lesson_model.dart';
import '../repositories/lesson_repository.dart';

class LearnController extends ChangeNotifier {
  final LessonRepository _repository = LessonRepository();

  List<LessonModel> _lessons = [];

  bool _isLoading = true;

  List<LessonModel> get lessons => _lessons;

  bool get isLoading => _isLoading;

  Future<void> loadLessons() async {
    try {
      _isLoading = true;
      notifyListeners();

      _lessons = await _repository.loadLessons(
        category: "hiragana",
      );
      print("Lessons Loaded: ${_lessons.length}");

for (final lesson in _lessons) {
  print("${lesson.character} - ${lesson.romaji}");
}

      print("Lessons Loaded: ${_lessons.length}");
    } catch (e, stackTrace) {
      print("ERROR: $e");
      print(stackTrace);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}