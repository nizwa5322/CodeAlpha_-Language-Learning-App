import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/lesson_data.dart';

class ProgressProvider extends ChangeNotifier {
  int _totalWordsLearned = 0;
  int _lessonsCompleted = 0;
  int _currentStreak = 0;
  int _quizAverage = 0;
  int _totalTimeSpent = 0;
  double _vocabularyProgress = 0.0;
  double _grammarProgress = 0.0;
  double _pronunciationProgress = 0.0;
  double _conversationProgress = 0.0;
  List<Map<String, dynamic>> _weeklyData = [];
  List<Map<String, dynamic>> _achievements = [];
  List<String> _learnedWords = [];

  ProgressProvider() {
    _loadProgress();
    _initializeAchievements();
  }

  // Getters
  int get totalWordsLearned => _totalWordsLearned;
  int get lessonsCompleted => _lessonsCompleted;
  int get currentStreak => _currentStreak;
  int get quizAverage => _quizAverage;
  int get totalTimeSpent => _totalTimeSpent;
  double get vocabularyProgress => _vocabularyProgress;
  double get grammarProgress => _grammarProgress;
  double get pronunciationProgress => _pronunciationProgress;
  double get conversationProgress => _conversationProgress;
  List<Map<String, dynamic>> get weeklyData => _weeklyData;
  List<Map<String, dynamic>> get achievements => _achievements;
  List<String> get learnedWords => _learnedWords;

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    _totalWordsLearned = prefs.getInt('total_words_learned') ?? 0;
    _lessonsCompleted = prefs.getInt('lessons_completed') ?? 0;
    _currentStreak = prefs.getInt('current_streak') ?? 0;
    _quizAverage = prefs.getInt('quiz_average') ?? 0;
    _totalTimeSpent = prefs.getInt('total_time_spent') ?? 0;
    _learnedWords = prefs.getStringList('learned_words') ?? [];

    _updateProgressValues();
    _generateWeeklyData();
    notifyListeners();
  }

  void _updateProgressValues() {
    // Calculate progress based on lessons
    final stats = LessonData.getLanguageStatistics('French');
    final totalLessons = stats['totalLessons'] as int;
    final completedLessons = stats['completedLessons'] as int;
    final overallProgress = stats['overallProgress'] as double;

    // Update the provider values
    _lessonsCompleted = completedLessons;

    // Calculate category-specific progress
    _vocabularyProgress = _calculateCategoryProgress('Vocabulary');
    _grammarProgress = _calculateCategoryProgress('Grammar');
    _pronunciationProgress = _calculateCategoryProgress('Pronunciation');
    _conversationProgress = _calculateCategoryProgress('Conversation');

    // Update total words learned from learned words list
    _totalWordsLearned = _learnedWords.length;

    // Log progress if needed (optional)
    debugPrint(
      'Total Lessons: $totalLessons, Completed: $completedLessons, Progress: ${(overallProgress * 100).toInt()}%',
    );
  }

  double _calculateCategoryProgress(String category) {
    final lessons = LessonData.getLessonsForLanguage(
      'French',
    ).where((l) => l.category == category).toList();
    if (lessons.isEmpty) return 0.0;
    final totalWords = lessons.fold(0, (sum, l) => sum + l.totalWords);
    final completedWords = lessons.fold(0, (sum, l) => sum + l.completedWords);
    return totalWords > 0 ? completedWords / totalWords : 0.0;
  }

  void _generateWeeklyData() {
    _weeklyData = List.generate(7, (index) {
      return {
        'day': index,
        'wordsLearned': 0, // Will be populated from saved data
      };
    });
  }

  void _initializeAchievements() {
    _achievements = [
      {
        'id': 'first_word',
        'title': 'First Word Learned',
        'description': 'Learned your first word',
        'icon': '🎯',
        'isUnlocked': _totalWordsLearned >= 1,
      },
      {
        'id': 'words_10',
        'title': 'Word Explorer',
        'description': 'Learned 10 words',
        'icon': '🔍',
        'isUnlocked': _totalWordsLearned >= 10,
      },
      {
        'id': 'words_50',
        'title': 'Vocabulary Builder',
        'description': 'Learned 50 words',
        'icon': '📚',
        'isUnlocked': _totalWordsLearned >= 50,
      },
      {
        'id': 'words_100',
        'title': 'Language Learner',
        'description': 'Learned 100 words',
        'icon': '🌟',
        'isUnlocked': _totalWordsLearned >= 100,
      },
      {
        'id': 'first_lesson',
        'title': 'First Lesson',
        'description': 'Completed your first lesson',
        'icon': '🎓',
        'isUnlocked': _lessonsCompleted >= 1,
      },
      {
        'id': 'streak_7',
        'title': '7 Day Streak',
        'description': 'Practiced for 7 days in a row',
        'icon': '🔥',
        'isUnlocked': _currentStreak >= 7,
      },
      {
        'id': 'quiz_master',
        'title': 'Quiz Master',
        'description': 'Scored 90% or higher on a quiz',
        'icon': '🏆',
        'isUnlocked': _quizAverage >= 90,
      },
    ];
  }

  Future<void> markWordLearned(String word) async {
    if (!_learnedWords.contains(word)) {
      _learnedWords.add(word);
      _totalWordsLearned = _learnedWords.length;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('total_words_learned', _totalWordsLearned);
      await prefs.setStringList('learned_words', _learnedWords);

      _updateProgressValues();
      _initializeAchievements();
      notifyListeners();
    }
  }

  Future<void> completeLesson() async {
    _lessonsCompleted++;
    _updateStreak();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lessons_completed', _lessonsCompleted);
    await prefs.setInt('current_streak', _currentStreak);
    await prefs.setString('last_active', DateTime.now().toIso8601String());

    _initializeAchievements();
    notifyListeners();
  }

  Future<void> _updateStreak() async {
    final prefs = await SharedPreferences.getInstance();
    final lastActive = prefs.getString('last_active');

    if (lastActive != null) {
      final lastDate = DateTime.parse(lastActive);
      final now = DateTime.now();
      final difference = now.difference(lastDate).inDays;

      if (difference == 1) {
        _currentStreak++;
      } else if (difference > 1) {
        _currentStreak = 0;
      }
    } else {
      _currentStreak = 1;
    }
  }

  Future<void> updateQuizScore(int score, int totalQuestions) async {
    final percentage = (score / totalQuestions * 100).toInt();
    _quizAverage = (percentage + _quizAverage) ~/ 2;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('quiz_average', _quizAverage);

    _initializeAchievements();
    notifyListeners();
  }

  Future<void> updateTimeSpent(int minutes) async {
    _totalTimeSpent += minutes;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('total_time_spent', _totalTimeSpent);
    notifyListeners();
  }

  void updateWeeklyData(int dayIndex, int wordsLearned) {
    if (dayIndex >= 0 && dayIndex < _weeklyData.length) {
      _weeklyData[dayIndex]['wordsLearned'] = wordsLearned;
      notifyListeners();
    }
  }

  Future<void> resetProgress() async {
    _totalWordsLearned = 0;
    _lessonsCompleted = 0;
    _currentStreak = 0;
    _quizAverage = 0;
    _totalTimeSpent = 0;
    _learnedWords = [];

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    _updateProgressValues();
    _initializeAchievements();
    notifyListeners();
  }

  Map<String, dynamic> getProgressSummary() {
    return {
      'totalWordsLearned': _totalWordsLearned,
      'lessonsCompleted': _lessonsCompleted,
      'currentStreak': _currentStreak,
      'quizAverage': _quizAverage,
      'totalTimeSpent': _totalTimeSpent,
      'vocabularyProgress': _vocabularyProgress,
      'grammarProgress': _grammarProgress,
      'pronunciationProgress': _pronunciationProgress,
      'conversationProgress': _conversationProgress,
    };
  }

  String getLevel() {
    if (_totalWordsLearned >= 100) return 'Advanced';
    if (_totalWordsLearned >= 50) return 'Intermediate';
    if (_totalWordsLearned >= 20) return 'Elementary';
    return 'Beginner';
  }

  String getLevelEmoji() {
    switch (getLevel()) {
      case 'Advanced':
        return '🌟';
      case 'Intermediate':
        return '⭐';
      case 'Elementary':
        return '📖';
      default:
        return '🌱';
    }
  }
}
