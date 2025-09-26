sealed class LoginState {}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateFailure extends LoginState {
  final String message;

  LoginStateFailure({required this.message});
}

class LoginStateSuccess extends LoginState {
  final dynamic data;

  LoginStateSuccess({this.data});
}
