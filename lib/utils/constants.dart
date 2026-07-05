import 'package:flutter/material.dart';

class AppConstants {
  // App Information
  static const String appName = 'Lingua Learn';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Interactive Language Learning App';

  // Shared Preferences Keys
  static const String prefUserId = 'user_id';
  static const String prefUserLanguage = 'user_language';
  static const String prefIsLoggedIn = 'is_logged_in';
  static const String prefThemeMode = 'theme_mode';
  static const String prefNotifications = 'notifications_enabled';
  static const String prefDailyReminder = 'daily_reminder_enabled';
  static const String prefReminderTime = 'reminder_time';
  static const String prefLastActive = 'last_active';
  static const String prefLearnedWords = 'learned_words';
  static const String prefQuizHistory = 'quiz_history';
  static const String prefCurrentStreak = 'current_streak';
  static const String prefTotalWordsLearned = 'total_words_learned';
  static const String prefLessonsCompleted = 'lessons_completed';

  // Database Constants
  static const String dbName = 'language_learning.db';
  static const int dbVersion = 1;

  // Animation Durations
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration animationDurationLong = Duration(milliseconds: 500);
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration snackBarDuration = Duration(seconds: 3);

  // API Endpoints (if using external API)
  static const String apiBaseUrl = 'https://api.languagelearning.com/v1';
  static const String apiTranslate = '/translate';
  static const String apiPronounce = '/pronounce';
  static const String apiWords = '/words';
  static const String apiLessons = '/lessons';

  // Max Items
  static const int maxRecentLessons = 5;
  static const int maxQuizQuestions = 10;
  static const int maxFlashcardsPerSession = 20;
  static const int maxAchievements = 20;

  // Categories
  static const List<String> categories = [
    'Vocabulary',
    'Grammar',
    'Phrases',
    'Pronunciation',
    'Conversation',
    'Reading',
    'Writing',
  ];

  // Difficulty Levels
  static const List<String> difficultyLevels = [
    'Beginner',
    'Elementary',
    'Intermediate',
    'Upper Intermediate',
    'Advanced',
    'Proficient',
  ];

  // Supported Languages
  static const List<Map<String, String>> supportedLanguages = [
    {'name': 'French', 'code': 'fr', 'flag': '🇫🇷', 'locale': 'fr-FR'},
    {'name': 'Spanish', 'code': 'es', 'flag': '🇪🇸', 'locale': 'es-ES'},
    {'name': 'German', 'code': 'de', 'flag': '🇩🇪', 'locale': 'de-DE'},
    {'name': 'Italian', 'code': 'it', 'flag': '🇮🇹', 'locale': 'it-IT'},
    {'name': 'Japanese', 'code': 'ja', 'flag': '🇯🇵', 'locale': 'ja-JP'},
    {'name': 'Chinese', 'code': 'zh', 'flag': '🇨🇳', 'locale': 'zh-CN'},
    {'name': 'Korean', 'code': 'ko', 'flag': '🇰🇷', 'locale': 'ko-KR'},
    {'name': 'Russian', 'code': 'ru', 'flag': '🇷🇺', 'locale': 'ru-RU'},
    {'name': 'Arabic', 'code': 'ar', 'flag': '🇸🇦', 'locale': 'ar-SA'},
    {'name': 'Portuguese', 'code': 'pt', 'flag': '🇵🇹', 'locale': 'pt-PT'},
  ];

  // Default Language
  static const String defaultLanguage = 'French';
  static const String defaultLocale = 'fr-FR';

  // Quiz Settings
  static const int defaultQuizQuestions = 10;
  static const int passingScore = 70;

  // Spacing
  static const double spacingSmall = 4.0;
  static const double spacingMedium = 8.0;
  static const double spacingLarge = 12.0;
  static const double spacingXL = 16.0;
  static const double spacingXXL = 24.0;

  // Border Radius
  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 12.0;
  static const double radiusXL = 16.0;
  static const double radiusXXL = 24.0;

  // Padding
  static const EdgeInsets paddingSmall = EdgeInsets.all(8.0);
  static const EdgeInsets paddingMedium = EdgeInsets.all(16.0);
  static const EdgeInsets paddingLarge = EdgeInsets.all(24.0);
  static const EdgeInsets paddingXL = EdgeInsets.all(32.0);

  // Font Sizes
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 14.0;
  static const double fontSizeLarge = 16.0;
  static const double fontSizeXL = 18.0;
  static const double fontSizeXXL = 20.0;
  static const double fontSizeXXXL = 24.0;
}
