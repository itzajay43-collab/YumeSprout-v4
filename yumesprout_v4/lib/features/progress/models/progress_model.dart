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

  // Progress Getters
  double get xpProgress =>
      nextLevelXp == 0 ? 0 : currentXp / nextLevelXp;

  double get weeklyProgress =>
      weeklyGoal == 0 ? 0 : weeklyCompleted / weeklyGoal;

  double get lessonProgress =>
      totalLessons == 0 ? 0 : completedLessons / totalLessons;

  // CopyWith
  ProgressModel copyWith({
    int? currentXp,
    int? nextLevelXp,
    int? level,
    int? streak,
    int? longestStreak,
    int? weeklyGoal,
    int? weeklyCompleted,
    int? hiraganaCompleted,
    int? hiraganaTotal,
    int? katakanaCompleted,
    int? katakanaTotal,
    int? kanjiCompleted,
    int? kanjiTotal,
    int? totalLessons,
    int? completedLessons,
    List<bool>? activity,
  }) {
    return ProgressModel(
      currentXp: currentXp ?? this.currentXp,
      nextLevelXp: nextLevelXp ?? this.nextLevelXp,
      level: level ?? this.level,
      streak: streak ?? this.streak,
      longestStreak: longestStreak ?? this.longestStreak,
      weeklyGoal: weeklyGoal ?? this.weeklyGoal,
      weeklyCompleted: weeklyCompleted ?? this.weeklyCompleted,
      hiraganaCompleted:
          hiraganaCompleted ?? this.hiraganaCompleted,
      hiraganaTotal:
          hiraganaTotal ?? this.hiraganaTotal,
      katakanaCompleted:
          katakanaCompleted ?? this.katakanaCompleted,
      katakanaTotal:
          katakanaTotal ?? this.katakanaTotal,
      kanjiCompleted:
          kanjiCompleted ?? this.kanjiCompleted,
      kanjiTotal:
          kanjiTotal ?? this.kanjiTotal,
      totalLessons:
          totalLessons ?? this.totalLessons,
      completedLessons:
          completedLessons ?? this.completedLessons,
      activity: activity ?? this.activity,
    );
  }

  // Firestore -> Model
  factory ProgressModel.fromMap(
      Map<String, dynamic> map) {
    return ProgressModel(
      currentXp: map['currentXp'] ?? 0,
      nextLevelXp: map['nextLevelXp'] ?? 100,
      level: map['level'] ?? 1,
      streak: map['streak'] ?? 0,
      longestStreak: map['longestStreak'] ?? 0,
      weeklyGoal: map['weeklyGoal'] ?? 7,
      weeklyCompleted: map['weeklyCompleted'] ?? 0,
      hiraganaCompleted:
          map['hiraganaCompleted'] ?? 0,
      hiraganaTotal:
          map['hiraganaTotal'] ?? 46,
      katakanaCompleted:
          map['katakanaCompleted'] ?? 0,
      katakanaTotal:
          map['katakanaTotal'] ?? 46,
      kanjiCompleted:
          map['kanjiCompleted'] ?? 0,
      kanjiTotal:
          map['kanjiTotal'] ?? 100,
      totalLessons:
          map['totalLessons'] ?? 0,
      completedLessons:
          map['completedLessons'] ?? 0,
      activity: List<bool>.from(
        map['activity'] ??
            List.generate(30, (_) => false),
      ),
    );
  }

  // Model -> Firestore
  Map<String, dynamic> toMap() {
    return {
      'currentXp': currentXp,
      'nextLevelXp': nextLevelXp,
      'level': level,
      'streak': streak,
      'longestStreak': longestStreak,
      'weeklyGoal': weeklyGoal,
      'weeklyCompleted': weeklyCompleted,
      'hiraganaCompleted': hiraganaCompleted,
      'hiraganaTotal': hiraganaTotal,
      'katakanaCompleted': katakanaCompleted,
      'katakanaTotal': katakanaTotal,
      'kanjiCompleted': kanjiCompleted,
      'kanjiTotal': kanjiTotal,
      'totalLessons': totalLessons,
      'completedLessons': completedLessons,
      'activity': activity,
    };
  }
}