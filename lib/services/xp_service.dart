import 'package:shared_preferences/shared_preferences.dart';

class XpService {
  static const String xpKey = "user_xp";

  Future<void> addXP(int amount) async {
    final prefs = await SharedPreferences.getInstance();

    int currentXP = prefs.getInt(xpKey) ?? 0;

    currentXP += amount;

    await prefs.setInt(xpKey, currentXP);
  }

  Future<int> getXP() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(xpKey) ?? 0;
  }

  Future<void> resetXP() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(xpKey, 0);
  }
}