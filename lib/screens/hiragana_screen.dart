import 'package:flutter/material.dart';
import '../data/hiragana_data.dart';
import 'character_screen.dart';

class HiraganaScreen extends StatelessWidget {
  const HiraganaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hiragana"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: hiragana.length,
        itemBuilder: (context, index) {
          final item = hiragana[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                item.jp,
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${item.romaji} • ${item.meaning}",
                style: const TextStyle(fontSize: 18),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CharacterScreen(
  jp: item.jp,
  romaji: item.romaji,
  meaning: item.meaning,
  example: item.example,
  currentIndex: index,
  totalCharacters: hiragana.length,
),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}