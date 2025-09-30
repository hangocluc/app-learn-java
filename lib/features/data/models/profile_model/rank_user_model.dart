import 'package:json_annotation/json_annotation.dart';

part 'rank_user_model.g.dart';

@JsonSerializable()
class RankUserModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? email;
  final double? mark;
  final String? avatar;

  const RankUserModel({
    this.id,
    this.name,
    this.email,
    this.mark,
    this.avatar,
  });

  factory RankUserModel.fromJson(Map<String, dynamic> json) =>
      _$RankUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$RankUserModelToJson(this);
}
