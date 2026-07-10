class HomeModel {
  // User
  final String greeting;
  final String userName;

  // Current Lesson
  final String currentLesson;
  final String character;

  // Lesson Progress
  final int currentStep;
  final int totalSteps;

  // User Progress
  final int streak;
  final int xp;
  final double progress;

  const HomeModel({
    required this.greeting,
    required this.userName,

    required this.currentLesson,
    required this.character,

    required this.currentStep,
    required this.totalSteps,

    required this.streak,
    required this.xp,
    required this.progress,
  });
}