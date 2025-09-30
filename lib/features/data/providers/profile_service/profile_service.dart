// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';

import '../network_service/src/api_path.dart';
import '../../../../../core/base/src/api_response.dart';
import '../../models/profile_model/profile_model.dart';
import '../../models/profile_model/rank_user_model.dart';

part 'profile_service.g.dart';

@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;

  @GET(ProfileApiPath.getProfileScore)
  Future<ApiResponse<List<ProfileModel>>> getProfileScores(
    @Query('userId') String userId,
  );

  @GET(ProfileApiPath.getProfileRank)
  Future<ApiResponse<List<RankUserModel>>> getProfileRank(
    @Query('topUser') int topUser,
  );
}
