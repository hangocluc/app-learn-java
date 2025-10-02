import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? gmail;
  final String? username;
  final String? imageUrl;
  final int? mark;
  final String? tokenDevice;

  const UserModel({
    this.id,
    this.gmail,
    this.username,
    this.imageUrl,
    this.mark,
    this.tokenDevice,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? id,
    String? gmail,
    String? username,
    String? imageUrl,
    int? mark,
    String? tokenDevice,
  }) {
    return UserModel(
      id: id ?? this.id,
      gmail: gmail ?? this.gmail,
      username: username ?? this.username,
      imageUrl: imageUrl ?? this.imageUrl,
      mark: mark ?? this.mark,
      tokenDevice: tokenDevice ?? this.tokenDevice,
    );
  }
}
