import '../../../entities/src/profile/profile_entity.dart';
import '../../../entities/src/profile/rank_user_entity.dart';

import '../../../../../core/base/src/api_response.dart';

abstract class ProfileRepository {
  Future<ApiResponse<List<ProfileEntity>>?> getProfileScores(String userId);
  Future<ApiResponse<List<RankUserEntity>>?> getProfileRank();
}
