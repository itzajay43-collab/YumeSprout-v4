import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {
  static const String hiraganaKey = "hiraganaProgress";
  static const String katakanaKey = "katakanaProgress";

  static const String lastIndexKey = "lastIndex";
  static const String categoryKey = "lastCategory";

  // ==========================
  // Hiragana Progress
  // ==========================

  Future<void> saveHiraganaProgress(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(hiraganaKey, value);
  }

  Future<int> getHiraganaProgress() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(hiraganaKey) ?? 0;
  }

  // ==========================
  // Katakana Progress
  // ==========================

  Future<void> saveKatakanaProgress(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(katakanaKey, value);
  }

  Future<int> getKatakanaProgress() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(katakanaKey) ?? 0;
  }

  // ==========================
  // Continue Learning
  // ==========================

  Future<void> saveLastIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(lastIndexKey, index);
  }

  Future<int> getLastIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(lastIndexKey) ?? 0;
  }

  Future<void> saveCategory(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(categoryKey, category);
  }

  Future<String> getCategory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(categoryKey) ?? "hiragana";
  }
}