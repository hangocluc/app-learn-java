part of 'compiler_cubit.dart';

abstract class CompilerCubitState {}

class CompilerCubitInitial extends CompilerCubitState {}

class CompilerCubitCompiling extends CompilerCubitState {}

class CompilerCubitSuccess extends CompilerCubitState {
  final String output;
  final int executionTime;

  CompilerCubitSuccess({
    required this.output,
    required this.executionTime,
  });
}

class CompilerCubitError extends CompilerCubitState {
  final String error;

  CompilerCubitError({required this.error});
}

class CompilerCubitFormatting extends CompilerCubitState {}

class CompilerCubitFormatted extends CompilerCubitState {
  final String formattedCode;

  CompilerCubitFormatted({required this.formattedCode});
}

class CompilerCubitValid extends CompilerCubitState {}

class CompilerCubitValidationError extends CompilerCubitState {
  final List<String> errors;

  CompilerCubitValidationError({required this.errors});
}
