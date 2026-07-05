import 'package:flutter/material.dart';
import '../data/lesson_data.dart';
import '../models/lesson_model.dart';
import '../models/word_model.dart';

class LessonProvider extends ChangeNotifier {
  List<Lesson> _allLessons = [];
  List<Lesson> _recentLessons = [];
  int _currentLessonIndex = 0;
  String _currentLanguage = 'French';

  LessonProvider() {
    _loadLessons();
  }

  void _loadLessons() {
    _allLessons = LessonData.getLessonsForLanguage(_currentLanguage);
    _recentLessons = _allLessons.take(5).toList();
    notifyListeners();
  }

  List<Lesson> get allLessons => _allLessons;
  List<Lesson> get recentLessons => _recentLessons;
  int get currentLessonIndex => _currentLessonIndex;

  void setLanguage(String language) {
    _currentLanguage = language;
    _loadLessons();
  }

  void setCurrentLesson(int index) {
    if (index >= 0 && index < _allLessons.length) {
      _currentLessonIndex = index;
      notifyListeners();
    }
  }

  Lesson? getCurrentLesson() {
    if (_currentLessonIndex < _allLessons.length) {
      return _allLessons[_currentLessonIndex];
    }
    return null;
  }

  Lesson? getLessonById(int id) {
    try {
      return _allLessons.firstWhere((lesson) => lesson.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Lesson> getLessonsByCategory(String category) {
    return _allLessons.where((lesson) => lesson.category == category).toList();
  }

  List<Lesson> getLessonsByDifficulty(int difficultyLevel) {
    return _allLessons.where((lesson) {
      return lesson.words.any(
        (word) => word.difficultyLevel == difficultyLevel,
      );
    }).toList();
  }

  List<Lesson> searchLessons(String query) {
    return LessonData.searchLessons(_currentLanguage, query);
  }

  void updateLessonProgress(int lessonId, int completedWords) {
    final index = _allLessons.indexWhere((lesson) => lesson.id == lessonId);
    if (index != -1) {
      final lesson = _allLessons[index];
      final updatedLesson = Lesson(
        id: lesson.id,
        title: lesson.title,
        description: lesson.description,
        language: lesson.language,
        category: lesson.category,
        words: lesson.words,
        totalWords: lesson.totalWords,
        completedWords: completedWords,
        imageUrl: lesson.imageUrl,
      );
      _allLessons[index] = updatedLesson;

      // Update recent lessons
      final recentIndex = _recentLessons.indexWhere((l) => l.id == lessonId);
      if (recentIndex != -1) {
        _recentLessons[recentIndex] = updatedLesson;
      }

      notifyListeners();
    }
  }

  void markLessonComplete(int lessonId) {
    final lesson = getLessonById(lessonId);
    if (lesson != null) {
      updateLessonProgress(lessonId, lesson.totalWords);
    }
  }

  List<Lesson> getIncompleteLessons() {
    return _allLessons.where((lesson) => !lesson.isCompleted).toList();
  }

  List<Lesson> getCompletedLessons() {
    return _allLessons.where((lesson) => lesson.isCompleted).toList();
  }

  double getOverallProgress() {
    if (_allLessons.isEmpty) return 0.0;
    final totalWords = _allLessons.fold(
      0,
      (sum, lesson) => sum + lesson.totalWords,
    );
    final completedWords = _allLessons.fold(
      0,
      (sum, lesson) => sum + lesson.completedWords,
    );
    return totalWords > 0 ? completedWords / totalWords : 0.0;
  }

  Lesson? getNextLesson() {
    final incomplete = getIncompleteLessons();
    return incomplete.isNotEmpty ? incomplete.first : null;
  }

  Lesson? getDailyLesson() {
    return LessonData.getDailyLesson(_currentLanguage);
  }

  List<Lesson> getRecommendedLessons() {
    return LessonData.getRecommendedLessons(_currentLanguage);
  }

  Map<String, dynamic> getLanguageStatistics() {
    return LessonData.getLanguageStatistics(_currentLanguage);
  }

  List<Word> getWordsForLesson(int lessonId) {
    final lesson = getLessonById(lessonId);
    return lesson?.words ?? [];
  }

  List<Word> getWordsByLanguage(String language) {
    return LessonData.getLessonsForLanguage(
      language,
    ).expand((lesson) => lesson.words).toList();
  }

  void resetAllProgress() {
    for (var i = 0; i < _allLessons.length; i++) {
      final lesson = _allLessons[i];
      _allLessons[i] = Lesson(
        id: lesson.id,
        title: lesson.title,
        description: lesson.description,
        language: lesson.language,
        category: lesson.category,
        words: lesson.words,
        totalWords: lesson.totalWords,
        completedWords: 0,
        imageUrl: lesson.imageUrl,
      );
    }
    notifyListeners();
  }
}
