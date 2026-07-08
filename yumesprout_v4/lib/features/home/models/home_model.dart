class HomeModel {
  final String userName;
  final int streak;
  final int level;
  final int xp;
  final double lessonProgress;

  const HomeModel({
    required this.userName,
    required this.streak,
    required this.level,
    required this.xp,
    required this.lessonProgress,
  });

  HomeModel copyWith({
    String? userName,
    int? streak,
    int? level,
    int? xp,
    double? lessonProgress,
  }) {
    return HomeModel(
      userName: userName ?? this.userName,
      streak: streak ?? this.streak,
      level: level ?? this.level,
      xp: xp ?? this.xp,
      lessonProgress: lessonProgress ?? this.lessonProgress,
    );
  }
}