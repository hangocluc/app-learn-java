import 'package:flutter/material.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Lesson Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
