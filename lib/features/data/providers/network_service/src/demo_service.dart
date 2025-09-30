// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:learn_java/features/data/models/program_model/program_response.dart';
// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';

import '../../../../../core/base/base.dart';
import '../../../models/demo_model/demo_model.dart';
import 'api_path.dart';

part 'demo_service.g.dart';

@RestApi()
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;

  @GET(AppApiPath.demo)
  Future<ApiResponse<DemoModel>> demo();

  @POST(AppApiPath.login)
  Future<ApiResponse> login(@Body() Map<String, dynamic> data);
  // @GET(DemoApiPath.notificationPath)
  // Future<ApiResponse<NotificationModel>> listNotification(
  //   @Query('genreId') String genreId,
  //   @Query('per_page') int perPage,
  //   @Query('page') int page,
  // );

  // @GET(NotificationApiPath.detailNotificationPath)
  // Future<ApiResponse<Notification>> detailNotification(
  //     @Path('articleId') String id);

  // @POST(NotificationApiPath.readNotificationPath)
  // Future<ApiResponse> readNotification(@Path('articleId') String id);

  // @POST(NotificationApiPath.getPointNotificationPath)
  // Future<ApiResponse> getPointNotification(@Path('articleId') String id);

  // @GET(NoticeApiPath.notices)
  // Future<ApiResponse> getNotices();

  // @POST(NoticeApiPath.noticeShowOff)
  // Future<ApiResponse> noticeShowOff(@Path('noticeId') String noticeId);
}
