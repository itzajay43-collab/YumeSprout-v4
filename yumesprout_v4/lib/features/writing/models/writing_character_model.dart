class WritingCharacterModel {
  // Basic Information
  final String id;

  final String character;

  final String romaji;

  final String meaning;

  // Writing Information
  final int strokeCount;

  final int order;

  // Progress
  final bool completed;

  final bool unlocked;

  // Rewards
  final int xp;

  const WritingCharacterModel({
    required this.id,
    required this.character,
    required this.romaji,
    required this.meaning,
    required this.strokeCount,
    required this.order,
    required this.completed,
    required this.unlocked,
    required this.xp,
  });
}