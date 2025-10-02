import 'package:json_annotation/json_annotation.dart';

part 'progress_request_model.g.dart';

@JsonSerializable()
class ProgressRequestModel {
  final String userId;
  final String lessonId;
  @JsonKey(name: 'completed')
  final String? topicId;
  final int status;
  final int quizStatus;
  final int? quizMarked;

  const ProgressRequestModel({
    required this.userId,
    required this.lessonId,
    this.topicId,
    required this.status,
    required this.quizStatus,
    this.quizMarked,
  });

  factory ProgressRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProgressRequestModelToJson(this);
}
