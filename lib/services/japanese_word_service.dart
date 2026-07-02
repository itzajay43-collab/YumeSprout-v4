import '../models/japanese_word.dart';

class JapaneseWordService {

  static final List<JapaneseWord> words = [

    JapaneseWord(
      japanese: "ありがとう",
      romaji: "Arigatou",
      meaning: "Thank You",
    ),

    JapaneseWord(
      japanese: "こんにちは",
      romaji: "Konnichiwa",
      meaning: "Hello",
    ),

    JapaneseWord(
      japanese: "おはよう",
      romaji: "Ohayou",
      meaning: "Good Morning",
    ),

    JapaneseWord(
      japanese: "こんばんは",
      romaji: "Konbanwa",
      meaning: "Good Evening",
    ),

    JapaneseWord(
      japanese: "さようなら",
      romaji: "Sayounara",
      meaning: "Goodbye",
    ),

  ];

  JapaneseWord getTodayWord() {

    final day = DateTime.now().day;

    return words[day % words.length];

  }
}