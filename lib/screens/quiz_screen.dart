import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/word_model.dart';
import '../providers/lesson_provider.dart';
import '../providers/language_provider.dart';
import '../widgets/quiz_option.dart';
import 'dart:math';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  List<Word> quizWords = [];
  int currentQuestion = 0;
  int score = 0;
  bool isAnswered = false;
  List<String> options = [];
  String? selectedAnswer;
  bool isQuizComplete = false;
  int correctAnswers = 0;
  List<bool> answerResults = [];
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _loadQuizData();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _loadQuizData() {
    final lessonProvider = Provider.of<LessonProvider>(context, listen: false);
    final languageProvider = Provider.of<LanguageProvider>(
      context,
      listen: false,
    );

    final allWords = lessonProvider.getWordsByLanguage(
      languageProvider.currentLanguage,
    );

    final random = Random();
    final shuffled = List<Word>.from(allWords)..shuffle(random);
    quizWords = shuffled.take(min(10, shuffled.length)).toList();

    if (quizWords.isEmpty) {
      quizWords = _getSampleWords();
    }

    _generateOptions();
    _animationController.forward(from: 0);
  }

  List<Word> _getSampleWords() {
    return [
      Word(
        word: 'Hello',
        translation: 'Bonjour',
        pronunciation: 'bɔ̃ʒuʁ',
        language: 'French',
        category: 'Greetings',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Goodbye',
        translation: 'Au revoir',
        pronunciation: 'o ʁəvwaʁ',
        language: 'French',
        category: 'Greetings',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Thank you',
        translation: 'Merci',
        pronunciation: 'mɛʁsi',
        language: 'French',
        category: 'Polite',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Yes',
        translation: 'Oui',
        pronunciation: 'wi',
        language: 'French',
        category: 'Basics',
        difficultyLevel: 1,
      ),
      Word(
        word: 'No',
        translation: 'Non',
        pronunciation: 'nɔ̃',
        language: 'French',
        category: 'Basics',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Please',
        translation: 'S\'il vous plaît',
        pronunciation: 'sil vu plɛ',
        language: 'French',
        category: 'Polite',
        difficultyLevel: 2,
      ),
      Word(
        word: 'Good morning',
        translation: 'Bonjour',
        pronunciation: 'bɔ̃ʒuʁ',
        language: 'French',
        category: 'Greetings',
        difficultyLevel: 1,
      ),
      Word(
        word: 'Good evening',
        translation: 'Bonsoir',
        pronunciation: 'bɔ̃swaʁ',
        language: 'French',
        category: 'Greetings',
        difficultyLevel: 1,
      ),
    ];
  }

  // ✅ FIXED: _generateOptions method with correct syntax
  void _generateOptions() {
    if (quizWords.isEmpty) return;

    final correctWord = quizWords[currentQuestion];
    final allTranslations = quizWords.map((w) => w.translation).toList();

    final random = Random();
    final wrongAnswers =
        allTranslations.where((t) => t != correctWord.translation).toList()
          ..shuffle(random);

    // Take only 3 wrong answers
    final selectedWrong = wrongAnswers.take(3).toList();

    // Combine correct and wrong answers then shuffle
    options = [correctWord.translation, ...selectedWrong]..shuffle(random);
  }

  void _selectAnswer(String answer) {
    if (isAnswered) return;

    setState(() {
      isAnswered = true;
      selectedAnswer = answer;

      final correctWord = quizWords[currentQuestion];
      if (answer == correctWord.translation) {
        score++;
        answerResults.add(true);
      } else {
        answerResults.add(false);
      }
      correctAnswers = score;
    });
  }

  void _nextQuestion() {
    setState(() {
      if (currentQuestion < quizWords.length - 1) {
        currentQuestion++;
        isAnswered = false;
        selectedAnswer = null;
        _generateOptions();
        _animationController.forward(from: 0);
      } else {
        isQuizComplete = true;
        _saveQuizResult();
      }
    });
  }

  void _saveQuizResult() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Quiz completed! Score: $score/${quizWords.length}'),
        backgroundColor: score > quizWords.length / 2
            ? Colors.green
            : Colors.orange,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      currentQuestion = 0;
      score = 0;
      correctAnswers = 0;
      isAnswered = false;
      selectedAnswer = null;
      isQuizComplete = false;
      answerResults.clear();
      _loadQuizData();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (quizWords.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: const Center(child: Text('No words available for quiz')),
      );
    }

    if (isQuizComplete) {
      return _buildQuizComplete(context);
    }

    final word = quizWords[currentQuestion];
    final progress = currentQuestion / quizWords.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Score: $score',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${currentQuestion + 1}/${quizWords.length}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 32),

            // Question
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'What is the translation of:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    word.word,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (word.pronunciation.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      '📢 ${word.pronunciation}',
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Options
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options[index];
                  bool isCorrect = option == word.translation;
                  bool isSelected = selectedAnswer == option;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: QuizOption(
                      option: option,
                      isSelected: isSelected,
                      isCorrect: isCorrect,
                      isAnswered: isAnswered,
                      onTap: () => _selectAnswer(option),
                    ),
                  );
                },
              ),
            ),

            // Next button
            if (isAnswered)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      currentQuestion < quizWords.length - 1
                          ? 'Next Question'
                          : 'See Results',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizComplete(BuildContext context) {
    final percentage = (score / quizWords.length * 100).toInt();
    String grade;
    IconData icon;
    Color color;

    if (percentage >= 90) {
      grade = 'Excellent! 🌟';
      icon = Icons.emoji_events;
      color = Colors.amber;
    } else if (percentage >= 70) {
      grade = 'Good Job! 👏';
      icon = Icons.thumb_up;
      color = Colors.green;
    } else if (percentage >= 50) {
      grade = 'Keep Practicing! 💪';
      icon = Icons.fitness_center;
      color = Colors.orange;
    } else {
      grade = 'Keep Learning! 📚';
      icon = Icons.book;
      color = Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Complete'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80, color: color),
              const SizedBox(height: 24),
              Text(
                grade,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Your Score',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                '$score / ${quizWords.length}',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '$percentage%',
                style: TextStyle(fontSize: 24, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Back to Quiz'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _resetQuiz,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Try Again'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
