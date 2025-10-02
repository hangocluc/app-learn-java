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
      // Return mock data only on specific network errors
      if (error.toString().contains('404') ||
          error.toString().contains('SocketException') ||
          error.toString().contains('timeout')) {
        final mockEntities = _getMockProfileScores(userId);
        return ApiResponse(
            mockEntities, 200, 'Mock data - API unavailable', true);
      }
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<RankUserEntity>>?> getProfileRank() async {
    try {
      final response =
          await service.getProfileRank(100); // Request more users for ranking

      if (response.isSuccessResponse && response.data != null) {
        final entities = response.data!
            .map((model) => _mapRankUserModelToEntity(model))
            .toList();
        // Debug size to verify data presence
        // ignore: avoid_print
        print('getProfileRank -> received ${entities.length} users');
        return ApiResponse(entities, 200, 'Success', true);
      } else {
        throw Exception(response.message);
      }
    } catch (error) {
      // Return mock data only on specific network errors
      if (error.toString().contains('404') ||
          error.toString().contains('SocketException') ||
          error.toString().contains('timeout')) {
        final mockEntities = _getMockRankUsers();
        return ApiResponse(
            mockEntities, 200, 'Mock data - API unavailable', true);
      }
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

  List<ProfileEntity> _getMockProfileScores(String userId) {
    return [
      ProfileEntity(
        id: '1',
        mark: 85.0,
        date: '2024-01-15',
        userId: userId,
      ),
      ProfileEntity(
        id: '2',
        mark: 92.0,
        date: '2024-01-10',
        userId: userId,
      ),
      ProfileEntity(
        id: '3',
        mark: 78.0,
        date: '2024-01-05',
        userId: userId,
      ),
      ProfileEntity(
        id: '4',
        mark: 88.0,
        date: '2024-01-01',
        userId: userId,
      ),
    ];
  }

  List<RankUserEntity> _getMockRankUsers() {
    return [
      RankUserEntity(
        id: '1',
        name: 'Nguyễn Văn A',
        email: 'nguyenvana@example.com',
        mark: 95.0,
        avatar: '',
      ),
      RankUserEntity(
        id: '2',
        name: 'Trần Thị B',
        email: 'tranthib@example.com',
        mark: 92.0,
        avatar: '',
      ),
      RankUserEntity(
        id: '3',
        name: 'Lê Văn C',
        email: 'levanc@example.com',
        mark: 88.0,
        avatar: '',
      ),
      RankUserEntity(
        id: '4',
        name: 'Phạm Thị D',
        email: 'phamthid@example.com',
        mark: 85.0,
        avatar: '',
      ),
      RankUserEntity(
        id: '5',
        name: 'Hoàng Văn E',
        email: 'hoangvane@example.com',
        mark: 82.0,
        avatar: '',
      ),
    ];
  }
}
