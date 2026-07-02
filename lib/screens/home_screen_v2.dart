import 'package:flutter/material.dart';

import '../models/home_data.dart';
import '../services/home_service.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/home_banner_v2.dart';
import '../widgets/continue_learning_card_v2.dart';
import '../widgets/daily_mission_card.dart';
import '../widgets/collection_hall_card.dart';
import '../widgets/learning_path_card.dart';
import '../widgets/japanese_word_card.dart';
import '../services/japanese_word_service.dart';
import '../widgets/section_title.dart';
import '../services/garden_service.dart';
import '../widgets/garden_card.dart';
import 'garden_screen.dart';

class HomeScreenV2 extends StatelessWidget {
  HomeScreenV2({super.key});

  final HomeService homeService = HomeService();
  final JapaneseWordService wordService =
    JapaneseWordService();
    final GardenService gardenService = GardenService();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppBar: false,
      child: FutureBuilder<HomeData>(
        future: homeService.getHomeData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final data = snapshot.data!;
          final word = wordService.getTodayWord();
          final stage = gardenService.getCurrentStage(data.xp);
          final nextStage = gardenService.getNextStage(data.xp);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 20),

                HomeBannerV2(
                  userName: "Ajay",
                  level: data.level,
                  levelName: "Blossom",
                  streak: data.streak,
                  xp: data.xp,
                  currentXP: data.currentXP,
                ),

                const SizedBox(height: 24),

GardenCard(
  stage: stage,
  currentXP: data.xp,
  nextXP: nextStage?.requiredXP ?? data.xp,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const GardenScreen(),
      ),
    );
  },
),

const SizedBox(height: 24),

                const SectionTitle(
                  title: "Today's Journey",
                  subtitle: "Continue your Japanese adventure",
                ),

                const SizedBox(height: 16),

                ContinueLearningCardV2(
                  character: "あ",
                  title: "Hiragana",
                  subtitle:
                      "${data.hiraganaProgress} / 46 Learned",
                  progress: data.hiraganaProgress / 46,
                  onTap: () {},
                ),

                const SizedBox(height: 24),

                const SectionTitle(
                  title: "Daily Challenge",
                  subtitle: "Earn bonus XP today",
                ),

                const SizedBox(height: 16),

                DailyMissionCard(
                  completed: 2,
                  total: 5,
                  onTap: () {},
                ),

                const SizedBox(height: 24),

                const SectionTitle(
                  title: "Learning Paths",
                  subtitle: "Choose your next lesson",
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    LearningPathCard(
                      emoji: "🌸",
                      title: "Hiragana",
                      subtitle: "46 Characters",
                      onTap: () {},
                    ),

                    const SizedBox(width: 12),

                    LearningPathCard(
                      emoji: "✏️",
                      title: "Katakana",
                      subtitle: "46 Characters",
                      onTap: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    LearningPathCard(
                      emoji: "📜",
                      title: "Grammar",
                      subtitle: "25 Lessons",
                      onTap: () {},
                    ),

                    const SizedBox(width: 12),

                    LearningPathCard(
                      emoji: "🎧",
                      title: "Listening",
                      subtitle: "Practice",
                      onTap: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                const SectionTitle(
                  title: "Collection Hall",
                  subtitle: "Achievements & Badges",
                ),

                const SizedBox(height: 16),

                CollectionHallCard(
                  achievements: 12,
                  badges: 8,
                  onTap: () {},
                ),
                const SizedBox(height: 24),

JapaneseWordCard(
  japanese: word.japanese,
  romaji: word.romaji,
  meaning: word.meaning,
),

const SizedBox(height: 24),

                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}