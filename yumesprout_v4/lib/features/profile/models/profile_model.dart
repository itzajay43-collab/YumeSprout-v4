class ProfileModel {
  final String name;
  final String japaneseName;
  final String title;

  final int level;
  final int xp;

  final int streak;
  final int lessonsCompleted;
  final int studyMinutes;
  final double accuracy;

  final int gardenLevel;
  final int passportCities;

  const ProfileModel({
    required this.name,
    required this.japaneseName,
    required this.title,
    required this.level,
    required this.xp,
    required this.streak,
    required this.lessonsCompleted,
    required this.studyMinutes,
    required this.accuracy,
    required this.gardenLevel,
    required this.passportCities,
  });

  String get formattedStudyTime {
    final hours = studyMinutes ~/ 60;
    final minutes = studyMinutes % 60;

    if (hours == 0) {
      return "$minutes min";
    }

    return "${hours}h ${minutes}m";
  }
}