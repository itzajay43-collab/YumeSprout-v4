import 'package:flutter/material.dart';

import '../services/progress_service.dart';
import '../screens/character_screen.dart';
import '../data/hiragana_data.dart';
import '../data/katakana_data.dart';
import '../models/character_model.dart';

class ContinueLearningCard extends StatelessWidget {
  const ContinueLearningCard({super.key});

  Future<Map<String, dynamic>> getData() async {
    final progressService = ProgressService();

    final category = await progressService.getCategory();
    final lastIndex = await progressService.getLastIndex();

    final List<CharacterModel> list =
        category == "hiragana" ? hiragana : katakana;

    final safeIndex =
        (lastIndex >= 0 && lastIndex < list.length) ? lastIndex : 0;

    final progress = category == "hiragana"
        ? await progressService.getHiraganaProgress()
        : await progressService.getKatakanaProgress();

    return {
      "progress": progress,
      "category": category,
      "character": list[safeIndex],
      "index": safeIndex,
      "list": list,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        }

        final progress = snapshot.data!["progress"] as int;
        final category = snapshot.data!["category"] as String;
        final character = snapshot.data!["character"] as CharacterModel;
        final index = snapshot.data!["index"] as int;
        final list = snapshot.data!["list"] as List<CharacterModel>;

        return InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CharacterScreen(
                  jp: character.jp,
                  romaji: character.romaji,
                  meaning: character.meaning,
                  example: character.example,
                  currentIndex: index,
                  totalCharacters: list.length,
                  characters: list,
                  category: category,
                ),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.15),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Text(
                      character.jp,
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Continue Learning",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Last Character: ${character.jp}",
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 10),

                      LinearProgressIndicator(
                        value: progress / list.length,
                        minHeight: 6,
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "$progress / ${list.length} Characters",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                const CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}