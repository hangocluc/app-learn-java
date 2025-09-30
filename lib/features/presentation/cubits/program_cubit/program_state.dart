part of 'program_cubit.dart';

sealed class ProgramState {}

class ProgramStateInitial extends ProgramState {}

class ProgramStateSuccess extends ProgramState {
  List<ProgramModel> programs;

  ProgramStateSuccess({required this.programs});
}

class ProgramStateError extends ProgramState {
  final String message;

  ProgramStateError({required this.message});
}
