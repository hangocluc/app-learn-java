import 'package:bloc/bloc.dart';
import 'package:learn_java/features/domain/entities/program_model.dart';
import 'package:learn_java/features/domain/usecases/src/demo_usecase.dart';

import '../../../../main.dart';

part 'program_state.dart';

class ProgramCubit extends Cubit<ProgramState> {
  ProgramCubit() : super(ProgramStateInitial());
  final demoUsecase = sl<DemoUsecase>();

  Future<void> getProgram() async {
    final result = await demoUsecase.getProgram();
    result.fold(
      (error) {
        emit(ProgramStateError(message: error.toString()));
      },
      (data) {
        emit(ProgramStateSuccess(programs: data));
      },
    );
  }
}
