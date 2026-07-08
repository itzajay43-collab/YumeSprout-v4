class LessonModel {
  final int id;
  final int lesson;
  final String unit;

  final String character;
  final String romaji;

  final String englishMeaning;
  final String hindiMeaning;

  final String difficulty;

  final int xp;

  final String audio;

  final List<String> strokeImages;

  const LessonModel({
    required this.id,
    required this.lesson,
    required this.unit,
    required this.character,
    required this.romaji,
    required this.englishMeaning,
    required this.hindiMeaning,
    required this.difficulty,
    required this.xp,
    required this.audio,
    required this.strokeImages,
  });

  factory LessonModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return LessonModel(
      id: json["id"],
      lesson: json["lesson"],
      unit: json["unit"],

      character: json["character"],
      romaji: json["romaji"],

      englishMeaning: json["meaning"]["en"],
      hindiMeaning: json["meaning"]["hi"],

      difficulty: json["difficulty"],

      xp: json["xp"],

      audio: json["audio"],

      strokeImages: List<String>.from(
        json["strokeImages"],
      ),
    );
  }
}