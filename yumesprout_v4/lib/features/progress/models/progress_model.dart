class ProgressModel {
  final int currentXp;
  final int nextLevelXp;
  final int level;

  final int streak;
  final int longestStreak;

  final int weeklyGoal;
  final int weeklyCompleted;

  final int hiraganaCompleted;
  final int hiraganaTotal;

  final int katakanaCompleted;
  final int katakanaTotal;

  final int kanjiCompleted;
  final int kanjiTotal;

  final int totalLessons;
  final int completedLessons;

  final List<bool> activity;

  const ProgressModel({
    required this.currentXp,
    required this.nextLevelXp,
    required this.level,
    required this.streak,
    required this.longestStreak,
    required this.weeklyGoal,
    required this.weeklyCompleted,
    required this.hiraganaCompleted,
    required this.hiraganaTotal,
    required this.katakanaCompleted,
    required this.katakanaTotal,
    required this.kanjiCompleted,
    required this.kanjiTotal,
    required this.totalLessons,
    required this.completedLessons,
    required this.activity,
  });

  double get xpProgress => currentXp / nextLevelXp;

  double get weeklyProgress =>
      weeklyCompleted / weeklyGoal;

  double get lessonProgress =>
      completedLessons / totalLessons;
}