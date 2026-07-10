import 'package:flutter/material.dart';

class AppShadows {
  AppShadows._();

  static final BoxShadow soft = BoxShadow(
    color: Colors.black.withOpacity(0.06),
    blurRadius: 18,
    offset: const Offset(0, 8),
  );

  static final BoxShadow medium = BoxShadow(
    color: Colors.black.withOpacity(0.10),
    blurRadius: 24,
    offset: const Offset(0, 12),
  );
}