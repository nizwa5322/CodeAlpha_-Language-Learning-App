import 'word_model.dart';

class Lesson {
  final int? id;
  final String title;
  final String description;
  final String language;
  final String category;
  final List<Word> words;
  final int totalWords;
  final int completedWords;
  final String? imageUrl;

  Lesson({
    this.id,
    required this.title,
    required this.description,
    required this.language,
    required this.category,
    required this.words,
    this.totalWords = 0,
    this.completedWords = 0,
    this.imageUrl,
  });

  double get progress {
    if (totalWords == 0) return 0.0;
    return completedWords / totalWords;
  }

  bool get isCompleted => progress >= 1.0;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'language': language,
      'category': category,
      'total_words': totalWords,
      'completed_words': completedWords,
      'image_url': imageUrl,
    };
  }

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      id: map['id'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      language: map['language'] ?? '',
      category: map['category'] ?? '',
      words: [], // Words will be loaded separately
      totalWords: map['total_words'] ?? 0,
      completedWords: map['completed_words'] ?? 0,
      imageUrl: map['image_url'],
    );
  }

  Lesson copyWith({
    int? id,
    String? title,
    String? description,
    String? language,
    String? category,
    List<Word>? words,
    int? totalWords,
    int? completedWords,
    String? imageUrl,
  }) {
    return Lesson(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      language: language ?? this.language,
      category: category ?? this.category,
      words: words ?? this.words,
      totalWords: totalWords ?? this.totalWords,
      completedWords: completedWords ?? this.completedWords,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() {
    return 'Lesson{id: $id, title: $title, language: $language, category: $category, progress: $progress}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Lesson && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
