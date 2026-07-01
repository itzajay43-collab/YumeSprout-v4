import 'package:flutter/material.dart';

import '../widgets/menu_card.dart';
import '../widgets/home_banner.dart';
import '../widgets/continue_learning_card.dart';

import 'hiragana_screen.dart';
import 'katakana_screen.dart';
import 'quiz_screen.dart';
import 'search_screen.dart';
import 'favourite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "🌸 YumeSprout",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const HomeBanner(),
            const SizedBox(height: 18),

            const ContinueLearningCard(),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  MenuCard(
                    icon: Icons.menu_book,
                    title: "Hiragana",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HiraganaScreen(),
                        ),
                      );
                      setState(() {});
                    },
                  ),

                  MenuCard(
                    icon: Icons.quiz,
                    title: "Quiz",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const QuizScreen(),
                        ),
                      );
                      setState(() {});
                    },
                  ),

                  MenuCard(
                    icon: Icons.search,
                    title: "Search",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SearchScreen(),
                        ),
                      );
                      setState(() {});
                    },
                  ),

                  MenuCard(
                    icon: Icons.favorite,
                    title: "Favourite",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FavouriteScreen(),
                        ),
                      );
                      setState(() {});
                    },
                  ),

                  MenuCard(
                    icon: Icons.edit,
                    title: "Katakana",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const KatakanaScreen(),
                        ),
                      );
                      setState(() {});
                    },
                  ),

                  MenuCard(
                    icon: Icons.auto_stories,
                    title: "Grammar",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}