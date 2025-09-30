// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['_id'] as String?,
      mark: (json['mark'] as num?)?.toDouble(),
      date: json['date'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'mark': instance.mark,
      'date': instance.date,
      'userId': instance.userId,
    };
