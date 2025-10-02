import 'package:equatable/equatable.dart';

class LessonEntity extends Equatable {
  final String id;
  final String title;
  final int totalTopic;
  final int learnCount;
  final QuizEntity? quiz;

  const LessonEntity({
    required this.id,
    required this.title,
    required this.totalTopic,
    required this.learnCount,
    this.quiz,
  });

  @override
  List<Object?> get props => [id, title, totalTopic, learnCount, quiz];
}

class QuizEntity extends Equatable {
  final String id;
  final String lessonId;
  final String name;
  final List<QuestionEntity> questions;

  const QuizEntity({
    required this.id,
    required this.lessonId,
    required this.name,
    required this.questions,
  });

  @override
  List<Object?> get props => [id, lessonId, name, questions];
}

class QuestionEntity extends Equatable {
  final String id;
  final String quizId;
  final int stt;
  final String content;
  final List<String> answers;
  final String correctAnswer;

  const QuestionEntity({
    required this.id,
    required this.quizId,
    required this.stt,
    required this.content,
    required this.answers,
    required this.correctAnswer,
  });

  @override
  List<Object?> get props => [id, quizId, stt, content, answers, correctAnswer];
}
