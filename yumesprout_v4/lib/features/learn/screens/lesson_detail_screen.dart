import 'package:flutter/material.dart';

import '../models/lesson_model.dart';

class LessonDetailScreen extends StatefulWidget {
  final LessonModel lesson;

  const LessonDetailScreen({
    super.key,
    required this.lesson,
  });

  @override
  State<LessonDetailScreen> createState() =>
      _LessonDetailScreenState();
}

class _LessonDetailScreenState
    extends State<LessonDetailScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final characters = widget.lesson.characters;

    if (characters.isEmpty) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text("Lesson coming soon"),
        ),
      );
    }

    final item = characters[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [

              LinearProgressIndicator(
                value: (currentIndex + 1) /
                    characters.length,
              ),

              const SizedBox(height: 35),

              Hero(
                tag: widget.lesson.id,
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    item.character,
                    style: const TextStyle(
                      fontSize: 110,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                item.romaji,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Pronunciation: ${item.pronunciation}",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 35),

              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Text(
                        item.example,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        item.meaning,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Card(
                color:
                    Colors.orange.shade50,
                child: Padding(
                  padding:
                      const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      const Text(
                        "💡",
                        style:
                            TextStyle(fontSize: 28),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          item.memoryTip,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              Row(
                children: [

                  Expanded(
                    child: OutlinedButton(
                      onPressed:
                          currentIndex == 0
                              ? null
                              : () {
                                  setState(() {
                                    currentIndex--;
                                  });
                                },
                      child:
                          const Text("Previous"),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: FilledButton(
                      onPressed: () {

                        if (currentIndex ==
                            characters.length -
                                1) {

                          ScaffoldMessenger.of(
                                  context)
                              .showSnackBar(
                            SnackBar(
                              content: Text(
                                "Lesson Complete 🎉 +${widget.lesson.xp} XP",
                              ),
                            ),
                          );

                          Navigator.pop(
                              context);

                          return;
                        }

                        setState(() {
                          currentIndex++;
                        });
                      },
                      child: Text(
                        currentIndex ==
                                characters.length -
                                    1
                            ? "Finish"
                            : "Next",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}