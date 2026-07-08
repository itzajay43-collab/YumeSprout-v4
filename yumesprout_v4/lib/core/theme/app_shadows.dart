import 'package:flutter/material.dart';

class AppShadows {
  static const List<BoxShadow> soft = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 18,
      offset: Offset(0, 8),
    ),
  ];

  static const List<BoxShadow> medium = [
    BoxShadow(
      color: Color(0x1F000000),
      blurRadius: 24,
      offset: Offset(0, 10),
    ),
  ];

  static const List<BoxShadow> strong = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 32,
      offset: Offset(0, 14),
    ),
  ];
}