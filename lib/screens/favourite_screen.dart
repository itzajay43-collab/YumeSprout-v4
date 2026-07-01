import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/hiragana_data.dart';
import 'character_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<String> favourites = [];

  @override
  void initState() {
    super.initState();
    loadFavourites();
  }

  Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> list = [];

    for (String key in prefs.getKeys()) {
      if (prefs.getBool(key) == true) {
        list.add(key);
      }
    }

    setState(() {
      favourites = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: const Text("❤️ Favourite"),
      ),
      body: favourites.isEmpty
          ? const Center(
              child: Text(
                "No Favourite Yet ❤️",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                final item = hiragana.firstWhere(
                  (e) => e.jp == favourites[index],
                );

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    title: Text(
                      item.jp,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${item.romaji} • ${item.meaning}",
                      style: const TextStyle(fontSize: 16),
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
                            currentIndex: hiragana.indexOf(item),
                            totalCharacters: hiragana.length,
                            characters: hiragana,
                            category: "hiragana",
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