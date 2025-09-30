// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankUserModel _$RankUserModelFromJson(Map<String, dynamic> json) =>
    RankUserModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mark: (json['mark'] as num?)?.toDouble(),
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$RankUserModelToJson(RankUserModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'mark': instance.mark,
      'avatar': instance.avatar,
    };
