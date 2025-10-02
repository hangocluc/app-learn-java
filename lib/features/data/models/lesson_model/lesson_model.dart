import 'package:json_annotation/json_annotation.dart';
import '../quiz_model/quiz_model.dart';

part 'lesson_model.g.dart';

@JsonSerializable()
class LessonModel {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final int totalTopic;
  @JsonKey(name: 'count')
  final int learnCount;
  final QuizModel? quiz;

  const LessonModel({
    required this.id,
    required this.title,
    required this.totalTopic,
    required this.learnCount,
    this.quiz,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) =>
      _$LessonModelFromJson(json);
  Map<String, dynamic> toJson() => _$LessonModelToJson(this);
}
