class PracticeItemModel {
  // Basic Info
  final String id;
  final String title;
  final String subtitle;

  // Icon
  final String emoji;

  // Reward
  final int xp;

  // Estimated Time (minutes)
  final int duration;

  // Status
  final bool isLocked;
  final bool isCompleted;

  const PracticeItemModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.xp,
    required this.duration,
    required this.isLocked,
    required this.isCompleted,
  });
}