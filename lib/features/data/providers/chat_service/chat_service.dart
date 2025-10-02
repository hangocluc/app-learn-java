import 'package:dio/dio.dart';
import '../../models/chat_model/chat_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/base/src/api_response.dart';
import '../network_service/src/api_path.dart';

part 'chat_service.g.dart';

@RestApi()
abstract class ChatService {
  factory ChatService(Dio dio, {String baseUrl}) = _ChatService;

  @GET(ChatApiPath.getCommentsByQuestion)
  Future<ApiResponse<List<ChatModel>>> getCommentsByQuestion(
      @Query('questionId') String questionId);

  @POST(ChatApiPath.updateComment)
  @FormUrlEncoded()
  Future<ApiResponse<List<ChatModel>>> likeComment(
      @Field('id') String id, @Field('userId') String userId);
}
