import 'package:learn_java/core/base/base.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase extends BaseUseCase<NoParams, dynamic> {
  @override
  Future<Either<Exception, NoParams>> call(params) {
    // do something
    throw UnimplementedError();
  }
}
