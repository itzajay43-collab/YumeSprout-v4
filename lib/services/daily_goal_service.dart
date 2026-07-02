import 'package:shared_preferences/shared_preferences.dart';

class DailyGoalService {
  static const String goalKey = "daily_goal_progress";
  static const String goalDateKey = "daily_goal_date";

  static const int dailyGoal = 5;

  Future<void> addProgress() async {
    final prefs = await SharedPreferences.getInstance();

    final today = DateTime.now().toString().substring(0, 10);
    final savedDate = prefs.getString(goalDateKey);

    if (savedDate != today) {
      await prefs.setString(goalDateKey, today);
      await prefs.setInt(goalKey, 0);
    }

    int progress = prefs.getInt(goalKey) ?? 0;

    if (progress < dailyGoal) {
      progress++;
      await prefs.setInt(goalKey, progress);
    }
  }

  Future<int> getProgress() async {
    final prefs = await SharedPreferences.getInstance();

    final today = DateTime.now().toString().substring(0, 10);
    final savedDate = prefs.getString(goalDateKey);

    if (savedDate != today) {
      await prefs.setString(goalDateKey, today);
      await prefs.setInt(goalKey, 0);
      return 0;
    }

    return prefs.getInt(goalKey) ?? 0;
  }

  int getGoal() => dailyGoal;

  Future<bool> isCompleted() async {
    return (await getProgress()) >= dailyGoal;
  }
}