import 'package:json_annotation/json_annotation.dart';
import 'question_model.dart';

part 'quiz_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuizModel {
  @JsonKey(name: '_id')
  final String id;
  final String lessonId;
  final String name;
  @JsonKey(name: 'question')
  final List<QuestionModel> questions;

  const QuizModel({
    required this.id,
    required this.lessonId,
    required this.name,
    required this.questions,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuizModelToJson(this);
}
