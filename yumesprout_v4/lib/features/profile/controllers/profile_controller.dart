import 'package:flutter/material.dart';

import '../models/profile_model.dart';

class ProfileController extends ChangeNotifier {
  final ProfileModel profile = const ProfileModel(
    name: "Ajay",
    japaneseName: "アジェイ",
    title: "Tokyo Beginner",

    level: 4,
    xp: 1250,

    streak: 12,
    lessonsCompleted: 60,
    studyMinutes: 845,
    accuracy: 94.2,

    gardenLevel: 2,
    passportCities: 2,
  );
}