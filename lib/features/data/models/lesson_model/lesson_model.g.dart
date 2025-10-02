// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonModel _$LessonModelFromJson(Map<String, dynamic> json) => LessonModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      totalTopic: (json['totalTopic'] as num).toInt(),
      learnCount: (json['count'] as num).toInt(),
      quiz: json['quiz'] == null
          ? null
          : QuizModel.fromJson(json['quiz'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LessonModelToJson(LessonModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'totalTopic': instance.totalTopic,
      'count': instance.learnCount,
      'quiz': instance.quiz,
    };
