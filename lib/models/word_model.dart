class Word {
  final int? id;
  final String word;
  final String translation;
  final String pronunciation;
  final String language;
  final String category;
  final String? exampleSentence;
  final int difficultyLevel;
  final bool isLearned;

  Word({
    this.id,
    required this.word,
    required this.translation,
    required this.pronunciation,
    required this.language,
    required this.category,
    this.exampleSentence,
    this.difficultyLevel = 1,
    this.isLearned = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'translation': translation,
      'pronunciation': pronunciation,
      'language': language,
      'category': category,
      'example_sentence': exampleSentence,
      'difficulty_level': difficultyLevel,
      'is_learned': isLearned ? 1 : 0,
    };
  }

  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(
      id: map['id'],
      word: map['word'],
      translation: map['translation'],
      pronunciation: map['pronunciation'],
      language: map['language'],
      category: map['category'],
      exampleSentence: map['example_sentence'],
      difficultyLevel: map['difficulty_level'],
      isLearned: map['is_learned'] == 1,
    );
  }
}
