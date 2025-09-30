// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:learn_java/features/data/models/program_model/program_detail_response.dart';
import 'package:learn_java/features/data/models/program_model/program_response.dart';
// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';

import '../network_service/src/api_path.dart';

part 'program_service.g.dart';

@RestApi()
abstract class ProgramService {
  factory ProgramService(Dio dio, {String baseUrl}) = _ProgramService;

  @GET(ProgramApiPath.program)
  Future<List<ProgramResponse>> getProgram();

  @GET(ProgramApiPath.programDetail)
  Future<List<ProgramDetailResponse>> getProgramDetail(
    @Query('programId') String programId,
  );
}
