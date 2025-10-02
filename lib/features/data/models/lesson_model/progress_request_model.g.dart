// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressRequestModel _$ProgressRequestModelFromJson(
        Map<String, dynamic> json) =>
    ProgressRequestModel(
      userId: json['userId'] as String,
      lessonId: json['lessonId'] as String,
      topicId: json['completed'] as String?,
      status: (json['status'] as num).toInt(),
      quizStatus: (json['quizStatus'] as num).toInt(),
      quizMarked: (json['quizMarked'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProgressRequestModelToJson(
        ProgressRequestModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'lessonId': instance.lessonId,
      'completed': instance.topicId,
      'status': instance.status,
      'quizStatus': instance.quizStatus,
      'quizMarked': instance.quizMarked,
    };
