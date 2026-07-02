import '../models/garden_stage.dart';

class GardenService {
  static const List<GardenStage> stages = [
    GardenStage(
      level: 1,
      emoji: "🌱",
      title: "Seed",
      requiredXP: 0,
    ),
    GardenStage(
      level: 2,
      emoji: "🌿",
      title: "Sprout",
      requiredXP: 100,
    ),
    GardenStage(
      level: 3,
      emoji: "🌳",
      title: "Young Tree",
      requiredXP: 250,
    ),
    GardenStage(
      level: 4,
      emoji: "🌸",
      title: "Blooming Sakura",
      requiredXP: 500,
    ),
    GardenStage(
      level: 5,
      emoji: "🏯",
      title: "Japanese Garden",
      requiredXP: 1000,
    ),
  ];

  GardenStage getCurrentStage(int xp) {
    GardenStage current = stages.first;

    for (final stage in stages) {
      if (xp >= stage.requiredXP) {
        current = stage;
      }
    }

    return current;
  }

  GardenStage? getNextStage(int xp) {
    for (final stage in stages) {
      if (stage.requiredXP > xp) {
        return stage;
      }
    }
    return null;
  }

  double getProgress(int xp) {
    final current = getCurrentStage(xp);
    final next = getNextStage(xp);

    if (next == null) return 1.0;

    final earned = xp - current.requiredXP;
    final total = next.requiredXP - current.requiredXP;

    return earned / total;
  }
}