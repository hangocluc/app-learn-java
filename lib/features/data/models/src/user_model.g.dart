// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['_id'] as String?,
      gmail: json['gmail'] as String?,
      username: json['username'] as String?,
      imageUrl: json['imageUrl'] as String?,
      mark: (json['mark'] as num?)?.toInt(),
      tokenDevice: json['tokenDevice'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      '_id': instance.id,
      'gmail': instance.gmail,
      'username': instance.username,
      'imageUrl': instance.imageUrl,
      'mark': instance.mark,
      'tokenDevice': instance.tokenDevice,
    };
