class UserProgress {
  final String userId;
  final String language;
  final Map<String, int> categoryScores;
  final int totalWordsLearned;
  final int lessonsCompleted;
  final int currentStreak;
  final DateTime lastActive;
  final List<String> masteredWords;
  final Map<String, int> quizHistory;

  UserProgress({
    required this.userId,
    required this.language,
    this.categoryScores = const {},
    this.totalWordsLearned = 0,
    this.lessonsCompleted = 0,
    this.currentStreak = 0,
    required this.lastActive,
    this.masteredWords = const [],
    this.quizHistory = const {},
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'language': language,
      'category_scores': categoryScores,
      'total_words_learned': totalWordsLearned,
      'lessons_completed': lessonsCompleted,
      'current_streak': currentStreak,
      'last_active': lastActive.toIso8601String(),
      'mastered_words': masteredWords,
      'quiz_history': quizHistory,
    };
  }

  factory UserProgress.fromMap(Map<String, dynamic> map) {
    return UserProgress(
      userId: map['user_id'],
      language: map['language'],
      categoryScores: Map<String, int>.from(map['category_scores'] ?? {}),
      totalWordsLearned: map['total_words_learned'],
      lessonsCompleted: map['lessons_completed'],
      currentStreak: map['current_streak'],
      lastActive: DateTime.parse(map['last_active']),
      masteredWords: List<String>.from(map['mastered_words'] ?? []),
      quizHistory: Map<String, int>.from(map['quiz_history'] ?? {}),
    );
  }
}
