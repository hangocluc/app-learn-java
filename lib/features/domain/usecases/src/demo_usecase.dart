import 'package:dartz/dartz.dart';
import 'package:learn_java/features/domain/entities/program_model.dart';

import '../../../../core/base/src/base_usecase.dart';
import '../../entities/src/demo_entity.dart';
import '../../repositories/src/app_repository.dart';

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
      return Right(response?.data);
    } on Exception catch (error) {
      return Left(error);
    }
  }

  Future<Either<Exception, List<ProgramModel>>> getProgram() async {
    try {
      final response = await repository.getPrograms();
      return Right(response);
    } on Exception catch (error) {
      return Left(error);
    }
  }
}
