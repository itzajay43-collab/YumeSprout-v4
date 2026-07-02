import '../models/home_data.dart';
import 'progress_service.dart';
import 'streak_service.dart';
import 'xp_service.dart';

class HomeService {
  Future<HomeData> getHomeData() async {
    final progress = await ProgressService().getHiraganaProgress();
    final streak = await StreakService().getStreak();
    final best = await StreakService().getBestStreak();
    final xp = await XpService().getXP();
    final level = await XpService().getLevel();
    final currentXP = await XpService().getCurrentLevelXP();

    return HomeData(
      streak: streak,
      bestStreak: best,
      xp: xp,
      level: level,
      currentXP: currentXP,
      hiraganaProgress: progress,
    );
  }
}