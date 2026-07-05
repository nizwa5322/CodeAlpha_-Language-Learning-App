import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';
import '../models/word_model.dart';
import '../models/lesson_model.dart';
import '../models/user_progress_model.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'language_learning.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create words table
    await db.execute('''
      CREATE TABLE words (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        word TEXT NOT NULL,
        translation TEXT NOT NULL,
        pronunciation TEXT,
        language TEXT NOT NULL,
        category TEXT NOT NULL,
        example_sentence TEXT,
        difficulty_level INTEGER DEFAULT 1,
        is_learned INTEGER DEFAULT 0,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    // Create lessons table
    await db.execute('''
      CREATE TABLE lessons (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        language TEXT NOT NULL,
        category TEXT NOT NULL,
        total_words INTEGER DEFAULT 0,
        completed_words INTEGER DEFAULT 0,
        image_url TEXT,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    // Create lesson_words junction table
    await db.execute('''
      CREATE TABLE lesson_words (
        lesson_id INTEGER,
        word_id INTEGER,
        order_index INTEGER DEFAULT 0,
        PRIMARY KEY (lesson_id, word_id),
        FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON DELETE CASCADE,
        FOREIGN KEY (word_id) REFERENCES words(id) ON DELETE CASCADE
      )
    ''');

    // Create user_progress table
    await db.execute('''
      CREATE TABLE user_progress (
        user_id TEXT PRIMARY KEY,
        language TEXT NOT NULL,
        total_words_learned INTEGER DEFAULT 0,
        lessons_completed INTEGER DEFAULT 0,
        current_streak INTEGER DEFAULT 0,
        last_active TEXT,
        quiz_history TEXT,
        mastered_words TEXT,
        category_scores TEXT,
        updated_at TEXT DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    // Create quiz_results table
    await db.execute('''
      CREATE TABLE quiz_results (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id TEXT NOT NULL,
        category TEXT NOT NULL,
        score INTEGER DEFAULT 0,
        total_questions INTEGER DEFAULT 0,
        percentage REAL DEFAULT 0.0,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    // Insert sample data
    await _insertSampleData(db);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle database upgrades here
  }

  Future<void> _insertSampleData(Database db) async {
    // Sample words for French
    final frenchWords = [
      {
        'word': 'Hello',
        'translation': 'Bonjour',
        'pronunciation': 'bɔ̃ʒuʁ',
        'language': 'French',
        'category': 'Greetings',
        'example_sentence': 'Bonjour, comment allez-vous?',
        'difficulty_level': 1,
      },
      {
        'word': 'Goodbye',
        'translation': 'Au revoir',
        'pronunciation': 'o ʁəvwaʁ',
        'language': 'French',
        'category': 'Greetings',
        'example_sentence': 'Au revoir, à bientôt!',
        'difficulty_level': 1,
      },
      {
        'word': 'Thank you',
        'translation': 'Merci',
        'pronunciation': 'mɛʁsi',
        'language': 'French',
        'category': 'Polite Phrases',
        'example_sentence': 'Merci beaucoup pour votre aide.',
        'difficulty_level': 1,
      },
      {
        'word': 'Please',
        'translation': 'S\'il vous plaît',
        'pronunciation': 'sil vu plɛ',
        'language': 'French',
        'category': 'Polite Phrases',
        'example_sentence': 'S\'il vous plaît, aidez-moi.',
        'difficulty_level': 1,
      },
      {
        'word': 'Yes',
        'translation': 'Oui',
        'pronunciation': 'wi',
        'language': 'French',
        'category': 'Basics',
        'difficulty_level': 1,
      },
      {
        'word': 'No',
        'translation': 'Non',
        'pronunciation': 'nɔ̃',
        'language': 'French',
        'category': 'Basics',
        'difficulty_level': 1,
      },
      {
        'word': 'Good morning',
        'translation': 'Bonjour',
        'pronunciation': 'bɔ̃ʒuʁ',
        'language': 'French',
        'category': 'Greetings',
        'difficulty_level': 1,
      },
      {
        'word': 'Good evening',
        'translation': 'Bonsoir',
        'pronunciation': 'bɔ̃swaʁ',
        'language': 'French',
        'category': 'Greetings',
        'difficulty_level': 1,
      },
    ];

    // Insert words
    for (var word in frenchWords) {
      await db.insert('words', word);
    }

    // Sample lessons
    final lessons = [
      {
        'title': 'French Greetings',
        'description': 'Learn essential French greetings and introductions.',
        'language': 'French',
        'category': 'Greetings',
        'total_words': 4,
        'completed_words': 0,
      },
      {
        'title': 'Polite Phrases',
        'description': 'Master common polite expressions in French.',
        'language': 'French',
        'category': 'Polite Phrases',
        'total_words': 2,
        'completed_words': 0,
      },
    ];

    for (var lesson in lessons) {
      await db.insert('lessons', lesson);
    }
  }

  // Word CRUD Operations
  Future<int> insertWord(Word word) async {
    final db = await database;
    return await db.insert('words', word.toMap());
  }

  Future<List<Word>> getWords({String? language, String? category}) async {
    final db = await database;
    List<Map<String, dynamic>> maps;

    if (language != null && category != null) {
      maps = await db.query(
        'words',
        where: 'language = ? AND category = ?',
        whereArgs: [language, category],
      );
    } else if (language != null) {
      maps = await db.query(
        'words',
        where: 'language = ?',
        whereArgs: [language],
      );
    } else {
      maps = await db.query('words');
    }

    return List.generate(maps.length, (i) => Word.fromMap(maps[i]));
  }

  Future<Word?> getWordById(int id) async {
    final db = await database;
    final maps = await db.query(
      'words',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Word.fromMap(maps.first);
    }
    return null;
  }

  Future<int> updateWord(Word word) async {
    final db = await database;
    return await db.update(
      'words',
      word.toMap(),
      where: 'id = ?',
      whereArgs: [word.id],
    );
  }

  Future<int> deleteWord(int id) async {
    final db = await database;
    return await db.delete(
      'words',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> markWordAsLearned(int wordId) async {
    final db = await database;
    await db.update(
      'words',
      {'is_learned': 1},
      where: 'id = ?',
      whereArgs: [wordId],
    );
  }

  // Lesson CRUD Operations
  Future<int> insertLesson(Lesson lesson) async {
    final db = await database;
    return await db.insert('lessons', lesson.toMap());
  }

  Future<List<Lesson>> getLessons({String? language, String? category}) async {
    final db = await database;
    List<Map<String, dynamic>> maps;

    if (language != null && category != null) {
      maps = await db.query(
        'lessons',
        where: 'language = ? AND category = ?',
        whereArgs: [language, category],
      );
    } else if (language != null) {
      maps = await db.query(
        'lessons',
        where: 'language = ?',
        whereArgs: [language],
      );
    } else {
      maps = await db.query('lessons');
    }

    return List.generate(maps.length, (i) => Lesson.fromMap(maps[i]));
  }

  Future<Lesson?> getLessonById(int id) async {
    final db = await database;
    final maps = await db.query(
      'lessons',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Lesson.fromMap(maps.first);
    }
    return null;
  }

  Future<int> updateLesson(Lesson lesson) async {
    final db = await database;
    return await db.update(
      'lessons',
      lesson.toMap(),
      where: 'id = ?',
      whereArgs: [lesson.id],
    );
  }

  Future<void> updateLessonProgress(int lessonId, int completedWords) async {
    final db = await database;
    await db.update(
      'lessons',
      {'completed_words': completedWords},
      where: 'id = ?',
      whereArgs: [lessonId],
    );
  }

  // Lesson-Word relationship
  Future<void> addWordToLesson(int lessonId, int wordId,
      {int order = 0}) async {
    final db = await database;
    await db.insert('lesson_words', {
      'lesson_id': lessonId,
      'word_id': wordId,
      'order_index': order,
    });
  }

  Future<List<Word>> getWordsForLesson(int lessonId) async {
    final db = await database;
    final maps = await db.rawQuery('''
      SELECT w.* FROM words w
      INNER JOIN lesson_words lw ON w.id = lw.word_id
      WHERE lw.lesson_id = ?
      ORDER BY lw.order_index
    ''', [lessonId]);

    return List.generate(maps.length, (i) => Word.fromMap(maps[i]));
  }

  // User Progress Operations
  Future<UserProgress?> getUserProgress(String userId) async {
    final db = await database;
    final maps = await db.query(
      'user_progress',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    if (maps.isNotEmpty) {
      return UserProgress.fromMap(maps.first);
    }
    return null;
  }

  Future<int> insertOrUpdateUserProgress(UserProgress progress) async {
    final db = await database;
    final existing = await getUserProgress(progress.userId);

    if (existing != null) {
      return await db.update(
        'user_progress',
        progress.toMap(),
        where: 'user_id = ?',
        whereArgs: [progress.userId],
      );
    } else {
      return await db.insert('user_progress', progress.toMap());
    }
  }

  Future<void> updateUserStreak(String userId) async {
    final db = await database;
    final progress = await getUserProgress(userId);
    if (progress != null) {
      final now = DateTime.now();
      final lastActive = progress.lastActive;
      final difference = now.difference(lastActive).inDays;

      int newStreak = progress.currentStreak;
      if (difference == 1) {
        newStreak++;
      } else if (difference > 1) {
        newStreak = 0;
      }

      await db.update(
        'user_progress',
        {
          'current_streak': newStreak,
          'last_active': now.toIso8601String(),
        },
        where: 'user_id = ?',
        whereArgs: [userId],
      );
    }
  }

  // Quiz Results Operations
  Future<int> saveQuizResult({
    required String userId,
    required String category,
    required int score,
    required int totalQuestions,
  }) async {
    final db = await database;
    final percentage = score / totalQuestions;
    return await db.insert('quiz_results', {
      'user_id': userId,
      'category': category,
      'score': score,
      'total_questions': totalQuestions,
      'percentage': percentage,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  Future<List<Map<String, dynamic>>> getQuizHistory(String userId) async {
    final db = await database;
    return await db.query(
      'quiz_results',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'created_at DESC',
      limit: 20,
    );
  }

  Future<double> getAverageQuizScore(String userId) async {
    final db = await database;
    final result = await db.rawQuery('''
      SELECT AVG(percentage) as average FROM quiz_results
      WHERE user_id = ?
    ''', [userId]);

    if (result.isNotEmpty && result.first['average'] != null) {
      return result.first['average'] as double;
    }
    return 0.0;
  }

  // Search and Filter
  Future<List<Word>> searchWords(String query, {String? language}) async {
    final db = await database;
    String whereClause = 'word LIKE ? OR translation LIKE ?';
    List<Object?> args = ['%$query%', '%$query%'];

    if (language != null) {
      whereClause += ' AND language = ?';
      args.add(language);
    }

    final maps = await db.query(
      'words',
      where: whereClause,
      whereArgs: args,
    );

    return List.generate(maps.length, (i) => Word.fromMap(maps[i]));
  }

  // Statistics
  Future<Map<String, dynamic>> getStatistics(String userId) async {
    final db = await database;

    final totalWords = await db.rawQuery('''
      SELECT COUNT(*) as count FROM words WHERE is_learned = 1
    ''');

    final totalLessons = await db.rawQuery('''
      SELECT COUNT(*) as count FROM lessons WHERE completed_words >= total_words
    ''');

    final categoryStats = await db.rawQuery('''
      SELECT category, COUNT(*) as count FROM words
      WHERE is_learned = 1
      GROUP BY category
    ''');

    return {
      'totalWordsLearned': totalWords.first['count'] ?? 0,
      'totalLessonsCompleted': totalLessons.first['count'] ?? 0,
      'categoryStats': categoryStats,
    };
  }

  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
