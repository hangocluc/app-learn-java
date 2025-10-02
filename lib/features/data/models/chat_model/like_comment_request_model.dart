import 'package:json_annotation/json_annotation.dart';

part 'like_comment_request_model.g.dart';

@JsonSerializable()
class LikeCommentRequestModel {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'userId')
  final String userId;

  const LikeCommentRequestModel({
    required this.id,
    required this.userId,
  });

  factory LikeCommentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LikeCommentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LikeCommentRequestModelToJson(this);
}
