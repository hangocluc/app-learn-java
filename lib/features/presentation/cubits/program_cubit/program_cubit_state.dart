part of 'program_cubit.dart';

abstract class ProgramCubitState {}

class ProgramCubitInitial extends ProgramCubitState {}

class ProgramCubitLoading extends ProgramCubitState {}

class ProgramCubitLoaded extends ProgramCubitState {
  final List<ProgramEntity> programs;

  ProgramCubitLoaded({required this.programs});
}

class ProgramCubitError extends ProgramCubitState {
  final String message;

  ProgramCubitError({required this.message});
}
