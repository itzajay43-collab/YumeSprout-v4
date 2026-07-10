import 'package:flutter/material.dart';

import '../models/home_model.dart';

class HomeController extends ChangeNotifier {
  final HomeModel home = const HomeModel(
    // ================= USER =================
    greeting: "Konbanwa",
    userName: "Ajay",

    // ================= CURRENT LESSON =================
    currentLesson: "Hiragana Basics",
    character: "あ",

    // ================= LESSON PROGRESS =================
    currentStep: 2,
    totalSteps: 10,

    // ================= USER STATS =================
    streak: 7,
    xp: 10,
    progress: 0.25,
  );
}