import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/lesson_model.dart';

class LessonRepository {
  Future<List<LessonModel>> loadLessons({
    required String category,
  }) async {
    print("Loading category: $category");

    final jsonString = await rootBundle.loadString(
      'assets/data/$category/lessons.json',
    );

    print("JSON Loaded Successfully");

    final List<dynamic> jsonData = json.decode(jsonString);

    print("Items Found: ${jsonData.length}");

    final lessons = jsonData
        .map((item) => LessonModel.fromJson(item))
        .toList();

    print("Parsed Lessons: ${lessons.length}");

    return lessons;
  }
}