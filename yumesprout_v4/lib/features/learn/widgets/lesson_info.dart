import 'package:flutter/material.dart';

class LessonInfo extends StatelessWidget {
  final String romaji;
  final String englishMeaning;
  final String hindiMeaning;

  const LessonInfo({
    super.key,
    required this.romaji,
    required this.englishMeaning,
    required this.hindiMeaning,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            romaji.toUpperCase(),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "$englishMeaning • $hindiMeaning",
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}