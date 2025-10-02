// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      id: json['_id'] as String,
      quizId: json['quizId'] as String,
      stt: (json['STT'] as num).toInt(),
      content: json['question'] as String,
      answers:
          (json['answer'] as List<dynamic>).map((e) => e as String).toList(),
      correctAnswer: json['correctAnswer'] as String,
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'quizId': instance.quizId,
      'STT': instance.stt,
      'question': instance.content,
      'answer': instance.answers,
      'correctAnswer': instance.correctAnswer,
    };
