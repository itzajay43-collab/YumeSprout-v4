import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/learn_controller.dart';
import '../widgets/lesson_card.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LearnController()..loadLessons(),
      child: const _LearnView(),
    );
  }
}

class _LearnView extends StatelessWidget {
  const _LearnView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LearnController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),

      appBar: AppBar(
        title: const Text("📚 Learn Japanese"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      body: controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.lessons.length,
              itemBuilder: (context, index) {
                final lesson = controller.lessons[index];

                return LessonCard(
                  lesson: lesson,
                  onTap: () {
                    // TODO:
                    // Open Lesson Detail Screen
                  },
                );
              },
            ),
    );
  }
}