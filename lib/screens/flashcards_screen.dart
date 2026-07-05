import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task3_languagelearningapp/widgets/flashcard_widget.dart';
import 'package:task3_languagelearningapp/providers/lesson_provider.dart';
import 'package:task3_languagelearningapp/providers/language_provider.dart';
import 'package:task3_languagelearningapp/models/word_model.dart';
import 'package:task3_languagelearningapp/services/audio_service.dart';

class FlashcardsScreen extends StatefulWidget {
  const FlashcardsScreen({super.key});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  int currentIndex = 0;
  List<Word> words = [];
  bool isFlipped = false;
  final AudioService _audioService = AudioService();
  List<String> learnedWords = [];

  @override
  void initState() {
    super.initState();
    _loadWords();
  }

  void _loadWords() {
    final lessonProvider = Provider.of<LessonProvider>(context, listen: false);
    final languageProvider = Provider.of<LanguageProvider>(
      context,
      listen: false,
    );

    words = lessonProvider.getWordsByLanguage(languageProvider.currentLanguage);
    if (words.isEmpty) {
      words = _getSampleWords();
    }
  }

  List<Word> _getSampleWords() {
    return [
      Word(
        word: 'Hello',
        translation: 'Bonjour',
        pronunciation: 'bɔ̃ʒuʁ',
        language: 'French',
        category: 'Greetings',
        exampleSentence: 'Hello, how are you?',
      ),
      Word(
        word: 'Goodbye',
        translation: 'Au revoir',
        pronunciation: 'o ʁəvwaʁ',
        language: 'French',
        category: 'Greetings',
        exampleSentence: 'Goodbye, see you later!',
      ),
      Word(
        word: 'Thank you',
        translation: 'Merci',
        pronunciation: 'mɛʁsi',
        language: 'French',
        category: 'Polite Phrases',
        exampleSentence: 'Thank you for your help!',
      ),
      Word(
        word: 'Please',
        translation: 'S\'il vous plaît',
        pronunciation: 'sil vu plɛ',
        language: 'French',
        category: 'Polite Phrases',
        exampleSentence: 'Please help me.',
      ),
      Word(
        word: 'Yes',
        translation: 'Oui',
        pronunciation: 'wi',
        language: 'French',
        category: 'Basics',
      ),
      Word(
        word: 'No',
        translation: 'Non',
        pronunciation: 'nɔ̃',
        language: 'French',
        category: 'Basics',
      ),
    ];
  }

  void _nextCard() {
    setState(() {
      if (currentIndex < words.length - 1) {
        currentIndex++;
        isFlipped = false;
      }
    });
  }

  void _previousCard() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        isFlipped = false;
      }
    });
  }

  void _playPronunciation() {
    final word = words[currentIndex];
    _audioService.speak(word.word, language: word.language);
  }

  void _markAsLearned() {
    final word = words[currentIndex];
    if (!learnedWords.contains(word.word)) {
      setState(() {
        learnedWords.add(word.word);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('"${word.word}" marked as learned! 🎉'),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Already marked as learned!'),
          backgroundColor: Colors.orange,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (words.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Flashcards')),
        body: const Center(child: Text('No words available for this language')),
      );
    }

    final word = words[currentIndex];
    final progress = (currentIndex + 1) / words.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcards'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: _playPronunciation,
            tooltip: 'Listen to pronunciation',
          ),
          IconButton(
            icon: const Icon(Icons.check_circle_outline),
            onPressed: _markAsLearned,
            tooltip: 'Mark as learned',
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress indicator
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Card ${currentIndex + 1} of ${words.length}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).primaryColor,
                  ),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ),

          // Flashcard
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFlipped = !isFlipped;
                  });
                },
                child: FlashcardWidget(word: word, isFlipped: isFlipped),
              ),
            ),
          ),

          // Navigation buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: currentIndex > 0 ? _previousCard : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Previous'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: currentIndex < words.length - 1 ? _nextCard : null,
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(
                    currentIndex < words.length - 1 ? 'Next' : 'Finish',
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
