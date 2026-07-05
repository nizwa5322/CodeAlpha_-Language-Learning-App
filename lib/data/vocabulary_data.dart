import '../models/word_model.dart';

class VocabularyData {
  // French Vocabulary
  static List<Word> getFrenchWords() {
    return [
      // Greetings
      Word(
        word: 'Bonjour',
        translation: 'Hello',
        pronunciation: 'bɔ̃ʒuʁ',
        language: 'French',
        category: 'Greetings',
        exampleSentence: 'Bonjour, comment allez-vous?',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Au revoir',
        translation: 'Goodbye',
        pronunciation: 'o ʁəvwaʁ',
        language: 'French',
        category: 'Greetings',
        exampleSentence: 'Au revoir, à bientôt!',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Bonsoir',
        translation: 'Good evening',
        pronunciation: 'bɔ̃swaʁ',
        language: 'French',
        category: 'Greetings',
        exampleSentence: 'Bonsoir, comment ça va?',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Salut',
        translation: 'Hi',
        pronunciation: 'saly',
        language: 'French',
        category: 'Greetings',
        exampleSentence: 'Salut, ça va?',
        difficultyLevel: 1,
      ),

      // Polite Phrases
      Word(
        word: 'Merci',
        translation: 'Thank you',
        pronunciation: 'mɛʁsi',
        language: 'French',
        category: 'Polite Phrases',
        exampleSentence: 'Merci beaucoup pour votre aide.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'S\'il vous plaît',
        translation: 'Please',
        pronunciation: 'sil vu plɛ',
        language: 'French',
        category: 'Polite Phrases',
        exampleSentence: 'S\'il vous plaît, pouvez-vous m\'aider?',
        difficultyLevel: 2,
      ),
      Word(
        word: 'De rien',
        translation: 'You\'re welcome',
        pronunciation: 'də ʁjɛ̃',
        language: 'French',
        category: 'Polite Phrases',
        exampleSentence: 'Merci! - De rien.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Excusez-moi',
        translation: 'Excuse me',
        pronunciation: 'ɛkskyze mwa',
        language: 'French',
        category: 'Polite Phrases',
        exampleSentence: 'Excusez-moi, où est la gare?',
        difficultyLevel: 2,
      ),

      // Basics
      Word(
        word: 'Oui',
        translation: 'Yes',
        pronunciation: 'wi',
        language: 'French',
        category: 'Basics',
        exampleSentence: 'Oui, je comprends.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Non',
        translation: 'No',
        pronunciation: 'nɔ̃',
        language: 'French',
        category: 'Basics',
        exampleSentence: 'Non, je ne sais pas.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Je',
        translation: 'I',
        pronunciation: 'ʒə',
        language: 'French',
        category: 'Basics',
        exampleSentence: 'Je suis étudiant.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Tu',
        translation: 'You (informal)',
        pronunciation: 'ty',
        language: 'French',
        category: 'Basics',
        exampleSentence: 'Tu es français?',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Il',
        translation: 'He',
        pronunciation: 'il',
        language: 'French',
        category: 'Basics',
        exampleSentence: 'Il est professeur.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Elle',
        translation: 'She',
        pronunciation: 'ɛl',
        language: 'French',
        category: 'Basics',
        exampleSentence: 'Elle est médecin.',
        difficultyLevel: 1,
      ),

      // Numbers
      Word(
        word: 'Un',
        translation: 'One',
        pronunciation: 'œ̃',
        language: 'French',
        category: 'Numbers',
        exampleSentence: 'J\'ai un chat.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Deux',
        translation: 'Two',
        pronunciation: 'dø',
        language: 'French',
        category: 'Numbers',
        exampleSentence: 'J\'ai deux chiens.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Trois',
        translation: 'Three',
        pronunciation: 'tʁwa',
        language: 'French',
        category: 'Numbers',
        exampleSentence: 'Il a trois enfants.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Quatre',
        translation: 'Four',
        pronunciation: 'katʁ',
        language: 'French',
        category: 'Numbers',
        exampleSentence: 'Nous avons quatre livres.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Cinq',
        translation: 'Five',
        pronunciation: 'sɛ̃k',
        language: 'French',
        category: 'Numbers',
        exampleSentence: 'Il y a cinq pommes.',
        difficultyLevel: 1,
      ),

      // Food
      Word(
        word: 'Pain',
        translation: 'Bread',
        pronunciation: 'pɛ̃',
        language: 'French',
        category: 'Food',
        exampleSentence: 'Je voudrais du pain.',
        difficultyLevel: 2,
      ),
      Word(
        word: 'Fromage',
        translation: 'Cheese',
        pronunciation: 'fʁɔmaʒ',
        language: 'French',
        category: 'Food',
        exampleSentence: 'J\'aime le fromage.',
        difficultyLevel: 2,
      ),
      Word(
        word: 'Vin',
        translation: 'Wine',
        pronunciation: 'vɛ̃',
        language: 'French',
        category: 'Food',
        exampleSentence: 'Un verre de vin, s\'il vous plaît.',
        difficultyLevel: 2,
      ),
      Word(
        word: 'Eau',
        translation: 'Water',
        pronunciation: 'o',
        language: 'French',
        category: 'Food',
        exampleSentence: 'Une bouteille d\'eau, s\'il vous plaît.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Café',
        translation: 'Coffee',
        pronunciation: 'kafe',
        language: 'French',
        category: 'Food',
        exampleSentence: 'Un café, s\'il vous plaît.',
        difficultyLevel: 1,
      ),
    ];
  }

  // Spanish Vocabulary
  static List<Word> getSpanishWords() {
    return [
      // Greetings
      Word(
        word: 'Hola',
        translation: 'Hello',
        pronunciation: 'ola',
        language: 'Spanish',
        category: 'Greetings',
        exampleSentence: '¡Hola! ¿Cómo estás?',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Adiós',
        translation: 'Goodbye',
        pronunciation: 'aðjos',
        language: 'Spanish',
        category: 'Greetings',
        exampleSentence: 'Adiós, hasta luego.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Buenos días',
        translation: 'Good morning',
        pronunciation: 'bwenos ðias',
        language: 'Spanish',
        category: 'Greetings',
        exampleSentence: '¡Buenos días! ¿Cómo amaneciste?',
        difficultyLevel: 2,
      ),
      Word(
        word: 'Buenas noches',
        translation: 'Good night',
        pronunciation: 'bwenas notʃes',
        language: 'Spanish',
        category: 'Greetings',
        exampleSentence: 'Buenas noches, que descanses.',
        difficultyLevel: 2,
      ),

      // Polite Phrases
      Word(
        word: 'Gracias',
        translation: 'Thank you',
        pronunciation: 'gɾasjas',
        language: 'Spanish',
        category: 'Polite Phrases',
        exampleSentence: '¡Muchas gracias por tu ayuda!',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Por favor',
        translation: 'Please',
        pronunciation: 'poɾ faβoɾ',
        language: 'Spanish',
        category: 'Polite Phrases',
        exampleSentence: 'Por favor, ¿puedes ayudarme?',
        difficultyLevel: 1,
      ),
      Word(
        word: 'De nada',
        translation: 'You\'re welcome',
        pronunciation: 'de naða',
        language: 'Spanish',
        category: 'Polite Phrases',
        exampleSentence: '¡Gracias! - De nada.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Perdón',
        translation: 'Sorry/Excuse me',
        pronunciation: 'peɾðon',
        language: 'Spanish',
        category: 'Polite Phrases',
        exampleSentence: 'Perdón, ¿podría repetir?',
        difficultyLevel: 1,
      ),

      // Basics
      Word(
        word: 'Sí',
        translation: 'Yes',
        pronunciation: 'si',
        language: 'Spanish',
        category: 'Basics',
        exampleSentence: 'Sí, entiendo.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'No',
        translation: 'No',
        pronunciation: 'no',
        language: 'Spanish',
        category: 'Basics',
        exampleSentence: 'No, no sé.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Yo',
        translation: 'I',
        pronunciation: 'ʝo',
        language: 'Spanish',
        category: 'Basics',
        exampleSentence: 'Yo soy estudiante.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Tú',
        translation: 'You (informal)',
        pronunciation: 'tu',
        language: 'Spanish',
        category: 'Basics',
        exampleSentence: 'Tú eres español.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Él',
        translation: 'He',
        pronunciation: 'el',
        language: 'Spanish',
        category: 'Basics',
        exampleSentence: 'Él es profesor.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Ella',
        translation: 'She',
        pronunciation: 'eʎa',
        language: 'Spanish',
        category: 'Basics',
        exampleSentence: 'Ella es médica.',
        difficultyLevel: 1,
      ),

      // Numbers
      Word(
        word: 'Uno',
        translation: 'One',
        pronunciation: 'uno',
        language: 'Spanish',
        category: 'Numbers',
        exampleSentence: 'Tengo un gato.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Dos',
        translation: 'Two',
        pronunciation: 'dos',
        language: 'Spanish',
        category: 'Numbers',
        exampleSentence: 'Tengo dos perros.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Tres',
        translation: 'Three',
        pronunciation: 'tɾes',
        language: 'Spanish',
        category: 'Numbers',
        exampleSentence: 'Él tiene tres hijos.',
        difficultyLevel: 1,
      ),

      // Food
      Word(
        word: 'Pan',
        translation: 'Bread',
        pronunciation: 'pan',
        language: 'Spanish',
        category: 'Food',
        exampleSentence: 'Quiero pan, por favor.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Queso',
        translation: 'Cheese',
        pronunciation: 'keso',
        language: 'Spanish',
        category: 'Food',
        exampleSentence: 'Me gusta el queso.',
        difficultyLevel: 2,
      ),
      Word(
        word: 'Vino',
        translation: 'Wine',
        pronunciation: 'bino',
        language: 'Spanish',
        category: 'Food',
        exampleSentence: 'Una copa de vino, por favor.',
        difficultyLevel: 2,
      ),
      Word(
        word: 'Agua',
        translation: 'Water',
        pronunciation: 'aɣwa',
        language: 'Spanish',
        category: 'Food',
        exampleSentence: 'Una botella de agua, por favor.',
        difficultyLevel: 1,
      ),
    ];
  }

  // German Vocabulary
  static List<Word> getGermanWords() {
    return [
      // Greetings
      Word(
        word: 'Hallo',
        translation: 'Hello',
        pronunciation: 'halo',
        language: 'German',
        category: 'Greetings',
        exampleSentence: 'Hallo! Wie geht es dir?',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Auf Wiedersehen',
        translation: 'Goodbye',
        pronunciation: 'aʊf viːdɐzeːən',
        language: 'German',
        category: 'Greetings',
        exampleSentence: 'Auf Wiedersehen, bis bald!',
        difficultyLevel: 2,
      ),
      Word(
        word: 'Guten Morgen',
        translation: 'Good morning',
        pronunciation: 'ɡuːtən mɔʁɡən',
        language: 'German',
        category: 'Greetings',
        exampleSentence: 'Guten Morgen! Wie hast du geschlafen?',
        difficultyLevel: 2,
      ),
      Word(
        word: 'Gute Nacht',
        translation: 'Good night',
        pronunciation: 'ɡuːtə naxt',
        language: 'German',
        category: 'Greetings',
        exampleSentence: 'Gute Nacht, schlaf gut!',
        difficultyLevel: 1,
      ),

      // Polite Phrases
      Word(
        word: 'Danke',
        translation: 'Thank you',
        pronunciation: 'daŋkə',
        language: 'German',
        category: 'Polite Phrases',
        exampleSentence: 'Danke für deine Hilfe!',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Bitte',
        translation: 'Please / You\'re welcome',
        pronunciation: 'bɪtə',
        language: 'German',
        category: 'Polite Phrases',
        exampleSentence: 'Bitte, hilf mir.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Entschuldigung',
        translation: 'Excuse me / Sorry',
        pronunciation: 'ɛntʃʊldɪɡʊŋ',
        language: 'German',
        category: 'Polite Phrases',
        exampleSentence: 'Entschuldigung, wo ist der Bahnhof?',
        difficultyLevel: 3,
      ),

      // Basics
      Word(
        word: 'Ja',
        translation: 'Yes',
        pronunciation: 'jaː',
        language: 'German',
        category: 'Basics',
        exampleSentence: 'Ja, ich verstehe.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Nein',
        translation: 'No',
        pronunciation: 'naɪn',
        language: 'German',
        category: 'Basics',
        exampleSentence: 'Nein, ich weiß nicht.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Ich',
        translation: 'I',
        pronunciation: 'ɪç',
        language: 'German',
        category: 'Basics',
        exampleSentence: 'Ich bin Student.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Du',
        translation: 'You (informal)',
        pronunciation: 'duː',
        language: 'German',
        category: 'Basics',
        exampleSentence: 'Du bist Deutscher.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Er',
        translation: 'He',
        pronunciation: 'eːɐ̯',
        language: 'German',
        category: 'Basics',
        exampleSentence: 'Er ist Lehrer.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Sie',
        translation: 'She / You (formal)',
        pronunciation: 'ziː',
        language: 'German',
        category: 'Basics',
        exampleSentence: 'Sie ist Ärztin.',
        difficultyLevel: 1,
      ),

      // Numbers
      Word(
        word: 'Eins',
        translation: 'One',
        pronunciation: 'aɪns',
        language: 'German',
        category: 'Numbers',
        exampleSentence: 'Ich habe eine Katze.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Zwei',
        translation: 'Two',
        pronunciation: 'tsvaɪ',
        language: 'German',
        category: 'Numbers',
        exampleSentence: 'Ich habe zwei Hunde.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Drei',
        translation: 'Three',
        pronunciation: 'dʁaɪ',
        language: 'German',
        category: 'Numbers',
        exampleSentence: 'Er hat drei Kinder.',
        difficultyLevel: 1,
      ),

      // Food
      Word(
        word: 'Brot',
        translation: 'Bread',
        pronunciation: 'bʁoːt',
        language: 'German',
        category: 'Food',
        exampleSentence: 'Ich möchte Brot, bitte.',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Käse',
        translation: 'Cheese',
        pronunciation: 'kɛːzə',
        language: 'German',
        category: 'Food',
        exampleSentence: 'Ich mag Käse.',
        difficultyLevel: 2,
      ),
      Word(
        word: 'Wein',
        translation: 'Wine',
        pronunciation: 'vaɪn',
        language: 'German',
        category: 'Food',
        exampleSentence: 'Ein Glas Wein, bitte.',
        difficultyLevel: 2,
      ),
      Word(
        word: 'Wasser',
        translation: 'Water',
        pronunciation: 'vasɐ',
        language: 'German',
        category: 'Food',
        exampleSentence: 'Eine Flasche Wasser, bitte.',
        difficultyLevel: 1,
      ),
    ];
  }

  // Get all vocabulary for a language
  static List<Word> getVocabularyForLanguage(String language) {
    switch (language.toLowerCase()) {
      case 'french':
        return getFrenchWords();
      case 'spanish':
        return getSpanishWords();
      case 'german':
        return getGermanWords();
      default:
        return getFrenchWords();
    }
  }

  // Get words by category
  static List<Word> getWordsByCategory(String language, String category) {
    final allWords = getVocabularyForLanguage(language);
    return allWords.where((word) => word.category == category).toList();
  }

  // Get all categories for a language
  static List<String> getCategoriesForLanguage(String language) {
    final words = getVocabularyForLanguage(language);
    final categories = words.map((word) => word.category).toSet();
    return categories.toList();
  }

  // Get word count by category
  static Map<String, int> getWordCountByCategory(String language) {
    final words = getVocabularyForLanguage(language);
    final Map<String, int> countMap = {};
    for (var word in words) {
      countMap[word.category] = (countMap[word.category] ?? 0) + 1;
    }
    return countMap;
  }

  // Get difficulty levels
  static List<int> getDifficultyLevels(String language) {
    final words = getVocabularyForLanguage(language);
    final levels = words.map((word) => word.difficultyLevel).toSet();
    return levels.toList()..sort();
  }

  // Search words
  static List<Word> searchWords(String language, String query) {
    final words = getVocabularyForLanguage(language);
    final lowerQuery = query.toLowerCase();
    return words.where((word) {
      return word.word.toLowerCase().contains(lowerQuery) ||
          word.translation.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  // Get random words
  static List<Word> getRandomWords(String language, {int count = 10}) {
    final words = getVocabularyForLanguage(language);
    final shuffled = List<Word>.from(words)..shuffle();
    final limit = count < shuffled.length ? count : shuffled.length;
    return shuffled.take(limit).toList();
  }

  // Get words for quiz
  static List<Word> getQuizWords(String language,
      {int count = 10, String? category}) {
    List<Word> words;
    if (category != null) {
      words = getWordsByCategory(language, category);
    } else {
      words = getVocabularyForLanguage(language);
    }
    final shuffled = List<Word>.from(words)..shuffle();
    final limit = count < shuffled.length ? count : shuffled.length;
    return shuffled.take(limit).toList();
  }

  // Get word of the day
  static Word? getWordOfTheDay(String language) {
    final words = getVocabularyForLanguage(language);
    if (words.isEmpty) return null;
    final now = DateTime.now();
    final index = now.day % words.length;
    return words[index];
  }

  // Get sample sentences for a word
  static List<String> getSampleSentences(String language, String word) {
    final words = getVocabularyForLanguage(language);
    final found =
        words.where((w) => w.word.toLowerCase() == word.toLowerCase()).toList();

    if (found.isEmpty) return [];

    final sentences = <String>[];
    for (var w in found) {
      if (w.exampleSentence != null) {
        sentences.add(w.exampleSentence!);
      }
    }
    return sentences;
  }
}
