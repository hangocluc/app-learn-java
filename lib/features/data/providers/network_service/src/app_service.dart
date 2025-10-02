// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';

import '../../../../../core/base/base.dart';
import '../../../models/demo_model/demo_model.dart';
import '../../../models/src/user_model.dart';
import 'api_path.dart';

part 'app_service.g.dart';

@RestApi()
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;

  @GET(DemoApiPath.demo)
  Future<ApiResponse<DemoModel>> demo();

  @POST(DemoApiPath.login)
  Future<ApiResponse> login(@Body() Map<String, dynamic> data);

  @POST(DemoApiPath.insertUser)
  Future<ApiResponse<UserModel>> getOrCreateNewUser(@Body() UserModel user);

  @GET(DemoApiPath.getUser)
  Future<ApiResponse<UserModel>> getUserInfo(@Query('gmail') String gmail);
}
