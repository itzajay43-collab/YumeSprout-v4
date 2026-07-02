import '../services/progress_service.dart';
import '../data/hiragana_data.dart';
import '../data/katakana_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/character_model.dart';
import '../services/xp_service.dart';
import '../services/daily_goal_service.dart';
import '../services/achievement_service.dart';

class CharacterScreen extends StatefulWidget {
  final String jp;
  final String romaji;
  final String meaning;
  final String example;
  final int currentIndex;
  final int totalCharacters;
  final String category;
  final List<CharacterModel> characters;

  const CharacterScreen({
    super.key,
    required this.jp,
    required this.romaji,
    required this.meaning,
    required this.example,
    required this.currentIndex,
    required this.totalCharacters,
    required this.characters,
    required this.category,
  });

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  final AudioPlayer player = AudioPlayer();
  final ProgressService progressService = ProgressService();
  final XpService xpService = XpService();
  final DailyGoalService dailyGoalService = DailyGoalService();
  final AchievementService achievementService = AchievementService();

  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    loadFavourite();
    saveProgress();
  }

  Future<void> loadFavourite() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      isFavourite = prefs.getBool(widget.jp) ?? false;
    });
  }

  Future<void> saveProgress() async {
    await progressService.saveLastIndex(widget.currentIndex);
    await progressService.saveCategory(widget.category);

    if (widget.category == "hiragana") {
      await progressService.saveHiraganaProgress(
        widget.currentIndex + 1,
      );
    } else {
      await progressService.saveKatakanaProgress(
        widget.currentIndex + 1,
      );
    }

    await xpService.addXP(5);
    await dailyGoalService.addProgress();

    await achievementService.unlock(
      AchievementService.firstCharacterKey,
    );
  }

  Future<void> toggleFavourite() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      isFavourite = !isFavourite;
    });

    await prefs.setBool(
      widget.jp,
      isFavourite,
    );
  }

  Future<void> playAudio() async {
    await player.play(
      AssetSource('audio/a.mp3'),
    );
  }
    void nextCharacter() {
    if (widget.currentIndex < widget.characters.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => CharacterScreen(
            jp: widget.characters[widget.currentIndex + 1].jp,
            romaji: widget.characters[widget.currentIndex + 1].romaji,
            meaning: widget.characters[widget.currentIndex + 1].meaning,
            example: widget.characters[widget.currentIndex + 1].example,
            currentIndex: widget.currentIndex + 1,
            totalCharacters: widget.characters.length,
            characters: widget.characters,
            category: widget.category,
          ),
        ),
      );
    }
  }

  void previousCharacter() {
    if (widget.currentIndex > 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => CharacterScreen(
            jp: widget.characters[widget.currentIndex - 1].jp,
            romaji: widget.characters[widget.currentIndex - 1].romaji,
            meaning: widget.characters[widget.currentIndex - 1].meaning,
            example: widget.characters[widget.currentIndex - 1].example,
            currentIndex: widget.currentIndex - 1,
            totalCharacters: widget.characters.length,
            characters: widget.characters,
            category: widget.category,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FC),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          widget.category == "hiragana"
              ? "🌸 Hiragana"
              : "✏️ Katakana",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: toggleFavourite,
              icon: Icon(
                isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: isFavourite
                    ? Colors.red
                    : Colors.grey,
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffEC407A),
                    Color(0xffF48FB1),
                  ],
                ),
                borderRadius: BorderRadius.circular(26),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(.18),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [

                  const Text(
                    "Japanese Character",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    widget.jp,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    widget.romaji,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    widget.meaning,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                                  ],
              ),
            ),

            const SizedBox(height: 24),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.translate_rounded,
                  color: Colors.pink,
                ),
                title: const Text("Meaning"),
                subtitle: Text(
                  widget.meaning,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.menu_book_rounded,
                  color: Colors.pink,
                ),
                title: const Text("Example"),
                subtitle: Text(
                  widget.example,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: playAudio,
                icon: const Icon(Icons.volume_up_rounded),
                label: const Text(
                  "Listen Pronunciation",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 28),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: previousCharacter,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Previous"),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: nextCharacter,
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text("Next"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Learning Progress",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: (widget.currentIndex + 1) /
                    widget.totalCharacters,
                minHeight: 12,
                backgroundColor: Colors.grey.shade300,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(
                  Colors.pink,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "${widget.currentIndex + 1} / ${widget.totalCharacters} Characters Learned",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                ),
                SizedBox(width: 6),
                Text(
                  "+5 XP Earned",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}