import 'package:bloc/bloc.dart';

import '../../../../main.dart';
import '../../../domain/usecases/src/demo_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final demoUsecase = getIt<DemoUsecase>();

  LoginCubit() : super(LoginStateInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginStateLoading());
    final result = await demoUsecase.login(
      email: email,
      password: password,
    );
    result.fold(
      (error) {
        emit(LoginStateFailure(message: error.toString()));
      },
      (data) {
        emit(LoginStateSuccess());
      },
    );
  }
}
