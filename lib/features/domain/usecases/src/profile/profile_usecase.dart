import 'package:dartz/dartz.dart';
import '../../../entities/src/profile/profile_entity.dart';
import '../../../entities/src/profile/rank_user_entity.dart';
import '../../../repositories/src/profile/profile_repository.dart';
import '../../../../../core/base/src/base_usecase.dart';

class ProfileUsecase extends BaseUseCase<List<ProfileEntity>, String> {
  final ProfileRepository repository;

  ProfileUsecase({required this.repository});

  @override
  Future<Either<Exception, List<ProfileEntity>>> call(String userId) async {
    try {
      final response = await repository.getProfileScores(userId);
      if (response != null &&
          response.isSuccessResponse &&
          response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
            Exception(response?.message ?? 'Failed to load profile scores'));
      }
    } on Exception catch (error) {
      return Left(error);
    }
  }

  Future<Either<Exception, List<RankUserEntity>>> getProfileRank() async {
    try {
      final response = await repository.getProfileRank();
      if (response != null &&
          response.isSuccessResponse &&
          response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
            Exception(response?.message ?? 'Failed to load profile rank'));
      }
    } on Exception catch (error) {
      return Left(error);
    }
  }
}
