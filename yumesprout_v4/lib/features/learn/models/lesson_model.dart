class LessonModel {
  // Basic Info
  final String id;
  final String title;
  final String subtitle;
  final String japanese;

  // Lesson Info
  final String level;
  final int xp;
  final int duration;

  // Progress
  final double progress;
  final bool isLocked;
  final bool isCompleted;

  // Lesson Characters
  final List<CharacterItem> characters;

  const LessonModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.japanese,
    required this.level,
    required this.xp,
    required this.duration,
    required this.progress,
    required this.isLocked,
    required this.isCompleted,
    this.characters = const [],
  });

  LessonModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? japanese,
    String? level,
    int? xp,
    int? duration,
    double? progress,
    bool? isLocked,
    bool? isCompleted,
    List<CharacterItem>? characters,
  }) {
    return LessonModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      japanese: japanese ?? this.japanese,
      level: level ?? this.level,
      xp: xp ?? this.xp,
      duration: duration ?? this.duration,
      progress: progress ?? this.progress,
      isLocked: isLocked ?? this.isLocked,
      isCompleted: isCompleted ?? this.isCompleted,
      characters: characters ?? this.characters,
    );
  }
}

class CharacterItem {
  final String character;
  final String romaji;
  final String pronunciation;
  final String example;
  final String meaning;
  final String memoryTip;

  const CharacterItem({
    required this.character,
    required this.romaji,
    required this.pronunciation,
    required this.example,
    required this.meaning,
    required this.memoryTip,
  });
}