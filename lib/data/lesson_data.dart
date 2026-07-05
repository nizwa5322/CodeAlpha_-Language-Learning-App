import '../models/lesson_model.dart';
import '../models/word_model.dart';
import 'vocabulary_data.dart';

class LessonData {
  // French Lessons
  static List<Lesson> getFrenchLessons() {
    final words = VocabularyData.getFrenchWords();

    return [
      Lesson(
        id: 1,
        title: 'French Greetings',
        description: 'Learn essential French greetings and introductions.',
        language: 'French',
        category: 'Greetings',
        words: words.where((w) => w.category == 'Greetings').toList(),
        totalWords: words.where((w) => w.category == 'Greetings').length,
        completedWords: 0,
        imageUrl: 'assets/images/greetings.jpg',
      ),
      Lesson(
        id: 2,
        title: 'Polite Phrases in French',
        description: 'Master common polite expressions in French.',
        language: 'French',
        category: 'Polite Phrases',
        words: words.where((w) => w.category == 'Polite Phrases').toList(),
        totalWords: words.where((w) => w.category == 'Polite Phrases').length,
        completedWords: 0,
        imageUrl: 'assets/images/polite.jpg',
      ),
      Lesson(
        id: 3,
        title: 'French Basics',
        description: 'Learn fundamental French words and pronouns.',
        language: 'French',
        category: 'Basics',
        words: words.where((w) => w.category == 'Basics').toList(),
        totalWords: words.where((w) => w.category == 'Basics').length,
        completedWords: 0,
        imageUrl: 'assets/images/basics.jpg',
      ),
      Lesson(
        id: 4,
        title: 'French Numbers',
        description: 'Learn to count in French from 1 to 5.',
        language: 'French',
        category: 'Numbers',
        words: words.where((w) => w.category == 'Numbers').toList(),
        totalWords: words.where((w) => w.category == 'Numbers').length,
        completedWords: 0,
        imageUrl: 'assets/images/numbers.jpg',
      ),
      Lesson(
        id: 5,
        title: 'French Food Vocabulary',
        description: 'Learn essential food and drink vocabulary in French.',
        language: 'French',
        category: 'Food',
        words: words.where((w) => w.category == 'Food').toList(),
        totalWords: words.where((w) => w.category == 'Food').length,
        completedWords: 0,
        imageUrl: 'assets/images/food.jpg',
      ),
    ];
  }

  // Spanish Lessons
  static List<Lesson> getSpanishLessons() {
    final words = VocabularyData.getSpanishWords();

    return [
      Lesson(
        id: 101,
        title: 'Spanish Greetings',
        description: 'Learn essential Spanish greetings and introductions.',
        language: 'Spanish',
        category: 'Greetings',
        words: words.where((w) => w.category == 'Greetings').toList(),
        totalWords: words.where((w) => w.category == 'Greetings').length,
        completedWords: 0,
        imageUrl: 'assets/images/greetings_es.jpg',
      ),
      Lesson(
        id: 102,
        title: 'Polite Phrases in Spanish',
        description: 'Master common polite expressions in Spanish.',
        language: 'Spanish',
        category: 'Polite Phrases',
        words: words.where((w) => w.category == 'Polite Phrases').toList(),
        totalWords: words.where((w) => w.category == 'Polite Phrases').length,
        completedWords: 0,
        imageUrl: 'assets/images/polite_es.jpg',
      ),
      Lesson(
        id: 103,
        title: 'Spanish Basics',
        description: 'Learn fundamental Spanish words and pronouns.',
        language: 'Spanish',
        category: 'Basics',
        words: words.where((w) => w.category == 'Basics').toList(),
        totalWords: words.where((w) => w.category == 'Basics').length,
        completedWords: 0,
        imageUrl: 'assets/images/basics_es.jpg',
      ),
      Lesson(
        id: 104,
        title: 'Spanish Numbers',
        description: 'Learn to count in Spanish from 1 to 5.',
        language: 'Spanish',
        category: 'Numbers',
        words: words.where((w) => w.category == 'Numbers').toList(),
        totalWords: words.where((w) => w.category == 'Numbers').length,
        completedWords: 0,
        imageUrl: 'assets/images/numbers_es.jpg',
      ),
      Lesson(
        id: 105,
        title: 'Spanish Food Vocabulary',
        description: 'Learn essential food and drink vocabulary in Spanish.',
        language: 'Spanish',
        category: 'Food',
        words: words.where((w) => w.category == 'Food').toList(),
        totalWords: words.where((w) => w.category == 'Food').length,
        completedWords: 0,
        imageUrl: 'assets/images/food_es.jpg',
      ),
    ];
  }

  // German Lessons
  static List<Lesson> getGermanLessons() {
    final words = VocabularyData.getGermanWords();

    return [
      Lesson(
        id: 201,
        title: 'German Greetings',
        description: 'Learn essential German greetings and introductions.',
        language: 'German',
        category: 'Greetings',
        words: words.where((w) => w.category == 'Greetings').toList(),
        totalWords: words.where((w) => w.category == 'Greetings').length,
        completedWords: 0,
        imageUrl: 'assets/images/greetings_de.jpg',
      ),
      Lesson(
        id: 202,
        title: 'Polite Phrases in German',
        description: 'Master common polite expressions in German.',
        language: 'German',
        category: 'Polite Phrases',
        words: words.where((w) => w.category == 'Polite Phrases').toList(),
        totalWords: words.where((w) => w.category == 'Polite Phrases').length,
        completedWords: 0,
        imageUrl: 'assets/images/polite_de.jpg',
      ),
      Lesson(
        id: 203,
        title: 'German Basics',
        description: 'Learn fundamental German words and pronouns.',
        language: 'German',
        category: 'Basics',
        words: words.where((w) => w.category == 'Basics').toList(),
        totalWords: words.where((w) => w.category == 'Basics').length,
        completedWords: 0,
        imageUrl: 'assets/images/basics_de.jpg',
      ),
      Lesson(
        id: 204,
        title: 'German Numbers',
        description: 'Learn to count in German from 1 to 5.',
        language: 'German',
        category: 'Numbers',
        words: words.where((w) => w.category == 'Numbers').toList(),
        totalWords: words.where((w) => w.category == 'Numbers').length,
        completedWords: 0,
        imageUrl: 'assets/images/numbers_de.jpg',
      ),
      Lesson(
        id: 205,
        title: 'German Food Vocabulary',
        description: 'Learn essential food and drink vocabulary in German.',
        language: 'German',
        category: 'Food',
        words: words.where((w) => w.category == 'Food').toList(),
        totalWords: words.where((w) => w.category == 'Food').length,
        completedWords: 0,
        imageUrl: 'assets/images/food_de.jpg',
      ),
    ];
  }

  // Get all lessons for a language
  static List<Lesson> getLessonsForLanguage(String language) {
    switch (language.toLowerCase()) {
      case 'french':
        return getFrenchLessons();
      case 'spanish':
        return getSpanishLessons();
      case 'german':
        return getGermanLessons();
      default:
        return getFrenchLessons();
    }
  }

  // Get all lessons (default to French)
  static List<Lesson> getLessons() {
    return getFrenchLessons();
  }

  // Get lesson by ID
  static Lesson? getLessonById(String language, int lessonId) {
    final lessons = getLessonsForLanguage(language);
    try {
      return lessons.firstWhere(
        (lesson) => lesson.id == lessonId,
        orElse: () => throw Exception('Lesson not found'),
      );
    } catch (e) {
      return null;
    }
  }

  // Get lesson safely with fallback
  static Lesson getLesson(String language, int lessonId) {
    final lesson = getLessonById(language, lessonId);
    if (lesson != null) {
      return lesson;
    } else {
      final lessons = getLessonsForLanguage(language);
      return lessons.isNotEmpty ? lessons.first : getFrenchLessons().first;
    }
  }

  // Get lessons by category
  static List<Lesson> getLessonsByCategory(String language, String category) {
    final lessons = getLessonsForLanguage(language);
    return lessons.where((lesson) => lesson.category == category).toList();
  }

  // Filter lessons by difficulty
  static List<Lesson> filterLessonsByDifficulty(
      String language, int maxDifficulty) {
    final lessons = getLessonsForLanguage(language);
    return lessons.where((lesson) {
      if (lesson.words.isEmpty) return false;
      return lesson.words
          .every((word) => word.difficultyLevel <= maxDifficulty);
    }).toList();
  }

  // Get lessons by specific difficulty level
  static List<Lesson> getLessonsByDifficulty(
      String language, int difficultyLevel) {
    final lessons = getLessonsForLanguage(language);
    return lessons.where((lesson) {
      if (lesson.words.isEmpty) return false;
      return lesson.words
          .any((word) => word.difficultyLevel == difficultyLevel);
    }).toList();
  }

  // Get lessons with specific word count range
  static List<Lesson> getLessonsByWordCount(
      String language, int minWords, int maxWords) {
    final lessons = getLessonsForLanguage(language);
    return lessons.where((lesson) {
      return lesson.totalWords >= minWords && lesson.totalWords <= maxWords;
    }).toList();
  }

  // Get lesson progress
  static double getLessonProgress(Lesson lesson) {
    if (lesson.totalWords == 0) return 0.0;
    return lesson.completedWords / lesson.totalWords;
  }

  // Check if lesson is completed
  static bool isLessonCompleted(Lesson lesson) {
    return lesson.completedWords >= lesson.totalWords;
  }

  // Get next lesson
  static Lesson? getNextLesson(String language, int currentLessonId) {
    final lessons = getLessonsForLanguage(language);
    final currentIndex = lessons.indexWhere((l) => l.id == currentLessonId);
    if (currentIndex != -1 && currentIndex < lessons.length - 1) {
      return lessons[currentIndex + 1];
    }
    return null;
  }

  // Get previous lesson
  static Lesson? getPreviousLesson(String language, int currentLessonId) {
    final lessons = getLessonsForLanguage(language);
    final currentIndex = lessons.indexWhere((l) => l.id == currentLessonId);
    if (currentIndex > 0) {
      return lessons[currentIndex - 1];
    }
    return null;
  }

  // Get recommended lessons based on progress
  static List<Lesson> getRecommendedLessons(String language) {
    final lessons = getLessonsForLanguage(language);
    final sorted = List<Lesson>.from(lessons)
      ..sort((a, b) => getLessonProgress(a).compareTo(getLessonProgress(b)));
    return sorted.take(3).toList();
  }

  // Get lesson summary
  static Map<String, dynamic> getLessonSummary(Lesson lesson) {
    final progress = getLessonProgress(lesson);
    final isCompleted = isLessonCompleted(lesson);

    return {
      'title': lesson.title,
      'progress': progress,
      'percentage': (progress * 100).toInt(),
      'isCompleted': isCompleted,
      'totalWords': lesson.totalWords,
      'completedWords': lesson.completedWords,
      'remainingWords': lesson.totalWords - lesson.completedWords,
      'category': lesson.category,
      'language': lesson.language,
    };
  }

  // Get lesson statistics for a language
  static Map<String, dynamic> getLanguageStatistics(String language) {
    final lessons = getLessonsForLanguage(language);
    final totalLessons = lessons.length;
    final completedLessons = lessons.where((l) => isLessonCompleted(l)).length;
    final totalWords = lessons.fold(0, (sum, l) => sum + l.totalWords);
    final completedWords = lessons.fold(0, (sum, l) => sum + l.completedWords);
    final overallProgress = totalWords > 0 ? completedWords / totalWords : 0.0;

    final categoryStats = <String, Map<String, dynamic>>{};
    for (var lesson in lessons) {
      if (!categoryStats.containsKey(lesson.category)) {
        categoryStats[lesson.category] = {
          'totalLessons': 0,
          'completedLessons': 0,
          'totalWords': 0,
          'completedWords': 0,
        };
      }
      final stats = categoryStats[lesson.category]!;
      stats['totalLessons'] = stats['totalLessons'] + 1;
      if (isLessonCompleted(lesson)) {
        stats['completedLessons'] = stats['completedLessons'] + 1;
      }
      stats['totalWords'] = stats['totalWords'] + lesson.totalWords;
      stats['completedWords'] = stats['completedWords'] + lesson.completedWords;
    }

    return {
      'totalLessons': totalLessons,
      'completedLessons': completedLessons,
      'totalWords': totalWords,
      'completedWords': completedWords,
      'overallProgress': overallProgress,
      'overallPercentage': (overallProgress * 100).toInt(),
      'categoryStats': categoryStats,
    };
  }

  // Get daily lesson
  static Lesson? getDailyLesson(String language) {
    final lessons = getLessonsForLanguage(language);
    if (lessons.isEmpty) return null;
    final now = DateTime.now();
    final index = now.day % lessons.length;
    return lessons[index];
  }

  // Search lessons
  static List<Lesson> searchLessons(String language, String query) {
    final lessons = getLessonsForLanguage(language);
    final lowerQuery = query.toLowerCase();
    return lessons.where((lesson) {
      return lesson.title.toLowerCase().contains(lowerQuery) ||
          lesson.description.toLowerCase().contains(lowerQuery) ||
          lesson.category.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  // Get incomplete lessons
  static List<Lesson> getIncompleteLessons(String language) {
    final lessons = getLessonsForLanguage(language);
    return lessons.where((lesson) => !isLessonCompleted(lesson)).toList();
  }

  // Get completed lessons
  static List<Lesson> getCompletedLessons(String language) {
    final lessons = getLessonsForLanguage(language);
    return lessons.where((lesson) => isLessonCompleted(lesson)).toList();
  }

  // Get lesson by title
  static Lesson? getLessonByTitle(String language, String title) {
    final lessons = getLessonsForLanguage(language);
    try {
      return lessons.firstWhere(
        (lesson) => lesson.title.toLowerCase() == title.toLowerCase(),
        orElse: () => throw Exception('Lesson not found'),
      );
    } catch (e) {
      return null;
    }
  }

  // Get lessons sorted by progress
  static List<Lesson> getLessonsSortedByProgress(String language) {
    final lessons = getLessonsForLanguage(language);
    return List<Lesson>.from(lessons)
      ..sort((a, b) => getLessonProgress(a).compareTo(getLessonProgress(b)));
  }

  // Get lessons by completion status
  static List<Lesson> getLessonsByCompletionStatus(String language) {
    final lessons = getLessonsForLanguage(language);
    final completed = lessons.where((l) => isLessonCompleted(l)).toList();
    final incomplete = lessons.where((l) => !isLessonCompleted(l)).toList();
    return [...incomplete, ...completed];
  }

  // Get lessons by difficulty range
  static List<Lesson> getLessonsByDifficultyRange(
      String language, int minDifficulty, int maxDifficulty) {
    final lessons = getLessonsForLanguage(language);
    return lessons.where((lesson) {
      if (lesson.words.isEmpty) return false;
      return lesson.words.every((word) {
        return word.difficultyLevel >= minDifficulty &&
            word.difficultyLevel <= maxDifficulty;
      });
    }).toList();
  }

  // Get average difficulty of a lesson
  static double getAverageDifficulty(Lesson lesson) {
    if (lesson.words.isEmpty) return 0.0;
    int totalDifficulty = 0;
    for (var word in lesson.words) {
      totalDifficulty += word.difficultyLevel;
    }
    return totalDifficulty / lesson.words.length;
  }

  // Get max difficulty in a lesson
  static int getMaxDifficulty(Lesson lesson) {
    if (lesson.words.isEmpty) return 0;
    int maxDifficulty = 0;
    for (var word in lesson.words) {
      if (word.difficultyLevel > maxDifficulty) {
        maxDifficulty = word.difficultyLevel;
      }
    }
    return maxDifficulty;
  }

  // Get min difficulty in a lesson
  static int getMinDifficulty(Lesson lesson) {
    if (lesson.words.isEmpty) return 0;
    int minDifficulty = 100;
    for (var word in lesson.words) {
      if (word.difficultyLevel < minDifficulty) {
        minDifficulty = word.difficultyLevel;
      }
    }
    return minDifficulty;
  }

  // Get difficulty distribution
  static Map<int, int> getDifficultyDistribution(Lesson lesson) {
    final distribution = <int, int>{};
    for (var word in lesson.words) {
      final difficulty = word.difficultyLevel;
      distribution[difficulty] = (distribution[difficulty] ?? 0) + 1;
    }
    return distribution;
  }

  // Get words by difficulty level in a lesson
  static List<Word> getWordsByDifficultyInLesson(
      Lesson lesson, int difficultyLevel) {
    return lesson.words.where((word) {
      return word.difficultyLevel == difficultyLevel;
    }).toList();
  }
}
