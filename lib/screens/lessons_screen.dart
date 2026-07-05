import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/lesson_provider.dart';
import '../widgets/lesson_card.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lessonProvider = Provider.of<LessonProvider>(context);
    final lessons = lessonProvider.allLessons;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lessons'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: lessons.isEmpty
          ? const Center(child: Text('No lessons available'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                final lesson = lessons[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: LessonCard(
                    lesson: lesson,
                    onTap: () {
                      // Navigate to lesson detail
                      _showLessonDetail(context, lesson);
                    },
                  ),
                );
              },
            ),
    );
  }

  void _showLessonDetail(BuildContext context, dynamic lesson) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(lesson.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(lesson.description),
            const SizedBox(height: 12),
            Text(
              'Words: ${lesson.totalWords}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Progress: ${(lesson.progress * 100).toInt()}%'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Start lesson
            },
            child: const Text('Start Lesson'),
          ),
        ],
      ),
    );
  }
}
