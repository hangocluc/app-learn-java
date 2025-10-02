// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) => QuizModel(
      id: json['_id'] as String,
      lessonId: json['lessonId'] as String,
      name: json['name'] as String,
      questions: (json['question'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
      '_id': instance.id,
      'lessonId': instance.lessonId,
      'name': instance.name,
      'question': instance.questions.map((e) => e.toJson()).toList(),
    };
