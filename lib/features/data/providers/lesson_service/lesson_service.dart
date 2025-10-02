// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';

import '../../../../../core/base/src/api_response.dart';
import '../../models/lesson_model/lesson_model.dart';
import '../../models/lesson_model/progress_request_model.dart';
import '../network_service/src/api_path.dart';

part 'lesson_service.g.dart';

@RestApi()
abstract class LessonService {
  factory LessonService(Dio dio, {String baseUrl}) = _LessonService;

  @GET(LessonApiPath.getAllLessons)
  Future<ApiResponse<List<LessonModel>>> getAllLessons();

  @POST(LessonApiPath.updateProcess)
  Future<ApiResponse<dynamic>> updateProcess(
    @Body() ProgressRequestModel body,
  );
}
