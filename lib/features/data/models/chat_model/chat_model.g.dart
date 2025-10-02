// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      questionId: json['questionId'] as String,
      quizId: json['quizId'] as String,
      username: json['username'] as String,
      message: json['message'] as String,
      imageUrl: json['imageUrl'] as String?,
      vote: (json['vote'] as num).toInt(),
      userLiked:
          (json['userLiked'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'questionId': instance.questionId,
      'quizId': instance.quizId,
      'username': instance.username,
      'message': instance.message,
      'imageUrl': instance.imageUrl,
      'vote': instance.vote,
      'userLiked': instance.userLiked,
    };
