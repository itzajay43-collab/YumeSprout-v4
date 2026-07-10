import 'package:flutter/material.dart';

class AppGradients {
  AppGradients._();

  static const LinearGradient primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff6366F1),
      Color(0xff8B5CF6),
    ],
  );

  static const LinearGradient hero = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffEEF2FF),
      Color(0xffFFFFFF),
    ],
  );

  static const LinearGradient success = LinearGradient(
    colors: [
      Color(0xff22C55E),
      Color(0xff4ADE80),
    ],
  );
}