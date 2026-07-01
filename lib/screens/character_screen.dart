import '../services/progress_service.dart';
import '../data/hiragana_data.dart';
import '../data/katakana_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/character_model.dart';
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
    await progressService.saveHiraganaProgress(widget.currentIndex + 1);
  } else {
    await progressService.saveKatakanaProgress(widget.currentIndex + 1);
  }
}
  Future<void> toggleFavourite() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      isFavourite = !isFavourite;
    });

    await prefs.setBool(widget.jp, isFavourite);
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
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: const Text("Character"),
        actions: [
          IconButton(
            onPressed: toggleFavourite,
            icon: Icon(
              isFavourite ? Icons.favorite : Icons.favorite_border,
              color: isFavourite ? Colors.red : Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      widget.jp,
                      style: const TextStyle(
                        fontSize: 90,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      widget.romaji,
                      style: const TextStyle(
                        fontSize: 34,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.translate,
                  color: Colors.pink,
                ),
                title: const Text("Meaning"),
                subtitle: Text(
                  widget.meaning,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.menu_book,
                  color: Colors.pink,
                ),
                title: const Text("Example"),
                subtitle: Text(
                  widget.example,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: playAudio,
                icon: const Icon(Icons.volume_up),
                label: const Text(
                  "Play Pronunciation",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: previousCharacter,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Previous"),
                  ),
                ),
                const SizedBox(width: 15),
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

const Text(
  "Learning Progress",
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 10),

ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: LinearProgressIndicator(
    value: (widget.currentIndex + 1) / widget.totalCharacters,
    minHeight: 12,
    backgroundColor: Colors.grey.shade300,
    valueColor: const AlwaysStoppedAnimation<Color>(Colors.pink),
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

const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}