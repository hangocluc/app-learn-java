import 'package:json_annotation/json_annotation.dart';

part 'rank_user_model.g.dart';

@JsonSerializable()
class RankUserModel {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'username')
  final String? name;
  @JsonKey(name: 'gmail')
  final String? email;
  @JsonKey(fromJson: _toDouble)
  final double? mark;
  @JsonKey(name: 'imageUrl')
  final String? avatar;
  final int? top;

  const RankUserModel({
    this.id,
    this.name,
    this.email,
    this.mark,
    this.avatar,
    this.top,
  });

  factory RankUserModel.fromJson(Map<String, dynamic> json) =>
      _$RankUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$RankUserModelToJson(this);
}

// Accept number or string for mark
double? _toDouble(Object? value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}
