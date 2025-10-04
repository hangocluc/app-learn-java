import 'package:dartz/dartz.dart';
import '../../../../core/base/src/base_usecase.dart';
import '../../entities/src/demo_entity.dart';
import '../../repositories/src/app_repository.dart';
import '../../../data/models/src/user_model.dart';

class DemoUsecase extends BaseUseCase<DemoEntity?, NoParams?> {
  final AppRepository repository;

  DemoUsecase({required this.repository});

  @override
  Future<Either<Exception, DemoEntity?>> call(params) async {
    try {
      final response = await repository.getDemo();
      return Right(response?.data);
    } on Exception catch (error) {
      return Left(error);
    }
  }

  Future<Either<Exception, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await repository.login(
        email: email,
        password: password,
      );
      return const Right(null);
    } on Exception catch (error) {
      return Left(error);
    }
  }

  Future<Either<Exception, UserModel?>> getOrCreateNewUser(
      UserModel user) async {
    try {
      final response = await repository.getOrCreateNewUser(user);
      return Right(response?.data);
    } on Exception catch (error) {
      return Left(error);
    }
  }

  Future<Either<Exception, UserModel?>> getUserInfo(String gmail) async {
    try {
      final response = await repository.getUserInfo(gmail);
      return Right(response?.data);
    } on Exception catch (error) {
      return Left(error);
    }
  }
}
