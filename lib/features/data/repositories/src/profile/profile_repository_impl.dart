import '../../../models/profile_model/profile_model.dart';
import '../../../models/profile_model/rank_user_model.dart';
import '../../../providers/profile_service/profile_service.dart';
import '../../../../domain/entities/src/profile/profile_entity.dart';
import '../../../../domain/entities/src/profile/rank_user_entity.dart';
import '../../../../domain/repositories/src/profile/profile_repository.dart';

import '../../../../../core/base/src/api_response.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileService service;

  ProfileRepositoryImpl({required this.service});

  @override
  Future<ApiResponse<List<ProfileEntity>>?> getProfileScores(
      String userId) async {
    try {
      final response = await service.getProfileScores(userId);

      if (response.isSuccessResponse && response.data != null) {
        final entities = response.data!
            .map((model) => _mapProfileModelToEntity(model))
            .toList();
        return ApiResponse(entities, 200, 'Success', true);
      } else {
        throw Exception(response.message);
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<RankUserEntity>>?> getProfileRank() async {
    try {
      final response = await service.getProfileRank(100);

      if (response.isSuccessResponse && response.data != null) {
        final entities = response.data!
            .map((model) => _mapRankUserModelToEntity(model))
            .toList();
        return ApiResponse(entities, 200, 'Success', true);
      } else {
        throw Exception(response.message);
      }
    } catch (error) {
      rethrow;
    }
  }

  ProfileEntity _mapProfileModelToEntity(ProfileModel model) {
    return ProfileEntity(
      id: model.id ?? '',
      mark: (model.mark ?? 0).toDouble(),
      date: model.date ?? '',
      userId: model.userId ?? '',
    );
  }

  RankUserEntity _mapRankUserModelToEntity(RankUserModel model) {
    return RankUserEntity(
      id: model.id ?? '',
      name: model.name ?? '',
      email: model.email ?? '',
      mark: (model.mark ?? 0).toDouble(),
      avatar: model.avatar ?? '',
    );
  }
}
