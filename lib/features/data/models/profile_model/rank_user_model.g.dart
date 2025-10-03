// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankUserModel _$RankUserModelFromJson(Map<String, dynamic> json) =>
    RankUserModel(
      id: json['_id'] as String?,
      name: json['username'] as String?,
      email: json['gmail'] as String?,
      mark: _toDouble(json['mark']),
      avatar: json['imageUrl'] as String?,
      top: (json['top'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RankUserModelToJson(RankUserModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.name,
      'gmail': instance.email,
      'mark': instance.mark,
      'imageUrl': instance.avatar,
      'top': instance.top,
    };
