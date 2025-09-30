import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: '_id')
  final String? id;
  final double? mark;
  final String? date;
  @JsonKey(name: 'userId')
  final String? userId;

  const ProfileModel({
    this.id,
    this.mark,
    this.date,
    this.userId,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
