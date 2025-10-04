import 'package:flutter/material.dart';
import '../../../domain/entities/src/lesson/lesson_entity.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({super.key, required this.lesson, required this.onTap});
  final LessonEntity lesson;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final topic = lesson.topics;
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: topic.length + 1, // thêm 1 để có button cuối
        itemBuilder: (context, index) {
          if (index == topic.length) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    onTap();
                  },
                  icon: const Icon(Icons.quiz, color: Colors.white),
                  label: const Text(
                    'Làm Quiz',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            );
          }
          final lesson = topic[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.title ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    lesson.content ?? '',
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
