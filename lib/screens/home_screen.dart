import 'package:flutter/material.dart';
import '../widgets/menu_card.dart';
import 'hiragana_screen.dart';
import 'favourite_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("🌸 YumeSprout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            MenuCard(
              icon: Icons.menu_book,
              title: "Hiragana",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HiraganaScreen(),
                  ),
                );
              },
            ),

            MenuCard(
              icon: Icons.edit,
              title: "Katakana",
              onTap: () {},
            ),

            MenuCard(
              icon: Icons.language,
              title: "Vocabulary",
              onTap: () {},
            ),

            MenuCard(
              icon: Icons.auto_stories,
              title: "Grammar",
              onTap: () {},
            ),

            MenuCard(
              icon: Icons.quiz,
              title: "Quiz",
              onTap: () {},
            ),

            MenuCard(
              icon: Icons.emoji_events,
              title: "Daily Challenge",
              onTap: () {},
            ),

            MenuCard(
  icon: Icons.favorite,
  title: "Favourite",
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const FavouriteScreen(),
      ),
    );
  },
),
          ],
        ),
      ),
    );
  }
}