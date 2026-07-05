import 'package:flutter/material.dart';
import '../data/vocabulary_data.dart';
import '../models/word_model.dart';

class LanguageProvider extends ChangeNotifier {
  String _currentLanguage = 'French';

  final List<String> _availableLanguages = [
    'French',
    'Spanish',
    'German',
    'Italian',
    'Japanese',
    'Chinese',
    'Korean',
    'Russian',
    'Arabic',
    'Portuguese',
  ];

  String get currentLanguage => _currentLanguage;
  List<String> get availableLanguages => _availableLanguages;

  void setLanguage(String language) {
    if (_availableLanguages.contains(language)) {
      _currentLanguage = language;
      notifyListeners();
    }
  }

  List<Word> getVocabulary() {
    return VocabularyData.getVocabularyForLanguage(_currentLanguage);
  }

  List<String> getCategories() {
    return VocabularyData.getCategoriesForLanguage(_currentLanguage);
  }

  Map<String, int> getWordCountByCategory() {
    return VocabularyData.getWordCountByCategory(_currentLanguage);
  }

  Word? getWordOfTheDay() {
    return VocabularyData.getWordOfTheDay(_currentLanguage);
  }

  List<Word> searchWords(String query) {
    return VocabularyData.searchWords(_currentLanguage, query);
  }

  List<Word> getRandomWords({int count = 10}) {
    return VocabularyData.getRandomWords(_currentLanguage, count: count);
  }

  String getLanguageFlag(String language) {
    final Map<String, String> flags = {
      'French': '🇫🇷',
      'Spanish': '🇪🇸',
      'German': '🇩🇪',
      'Italian': '🇮🇹',
      'Japanese': '🇯🇵',
      'Chinese': '🇨🇳',
      'Korean': '🇰🇷',
      'Russian': '🇷🇺',
      'Arabic': '🇸🇦',
      'Portuguese': '🇵🇹',
    };
    return flags[language] ?? '🌍';
  }
}
