import 'package:json_annotation/json_annotation.dart';

part 'api_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponseModel<T> {
  final bool success;
  final String message;
  final T? data;
  final String? error;

  const ApiResponseModel({
    required this.success,
    required this.message,
    this.data,
    this.error,
  });

  factory ApiResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseModelToJson(this, toJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class ListResponseModel<T> {
  final bool success;
  final String message;
  final List<T>? data;
  final String? error;

  const ListResponseModel({
    required this.success,
    required this.message,
    this.data,
    this.error,
  });

  factory ListResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ListResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ListResponseModelToJson(this, toJsonT);
}
