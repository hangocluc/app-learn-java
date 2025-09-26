import '../../../../core/base/src/base_usecase.dart';
import '../../entities/src/demo_entity.dart';
import '../../repositories/src/authentication/demo_repository.dart';
import 'package:dartz/dartz.dart';

class DemoUsecase extends BaseUseCase<DemoEntity?, NoParams?> {
  final DemoRepository repository;

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
      return Right(response?.data);
    } on Exception catch (error) {
      return Left(error);
    }
  }
}
