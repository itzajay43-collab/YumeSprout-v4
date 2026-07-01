import 'package:flutter/material.dart';

import '../data/katakana_data.dart';
import 'character_screen.dart';

class KatakanaScreen extends StatelessWidget {
  const KatakanaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text("Katakana"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: katakana.length,
        itemBuilder: (context, index) {
          final item = katakana[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text(
                  item.jp,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(item.romaji),
              subtitle: Text(item.meaning),
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
                      totalCharacters: katakana.length,
                      characters: katakana,
                      category: "katakana",
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