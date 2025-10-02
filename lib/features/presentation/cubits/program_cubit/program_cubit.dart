import 'package:bloc/bloc.dart';
import 'package:learn_java/features/domain/entities/src/program/program_detail.dart';
import 'package:learn_java/features/domain/entities/src/program/program_model.dart';
import 'package:learn_java/features/domain/usecases/src/program_usecase.dart';

import '../../../../main.dart';

part 'program_state.dart';

class ProgramCubit extends Cubit<ProgramState> {
  ProgramCubit() : super(ProgramStateInitial());
  final _programUsecase = sl.get<ProgramUsecase>();

  Future<void> getProgram() async {
    final result = await _programUsecase.getProgram();
    result.fold(
      (error) {
        emit(ProgramStateError(message: error.toString()));
      },
      (data) {
        emit(ProgramStateSuccess(programs: data));
      },
    );
  }

  Future<List<ProgramDetail>?> getDetailProgram(String id) async {
    final result = await _programUsecase.getProgramDetail(id);
    return result.fold(
      (error) {
        return null;
      },
      (data) {
        return data;
      },
    );
  }
}
