import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(fromJson: _toDouble)
  final double? mark;
  @JsonKey(fromJson: _toString)
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

// Accept number or string for mark
double? _toDouble(Object? value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

// Coerce any value to string for date
String? _toString(Object? value) {
  if (value == null) return null;
  return value.toString();
}
