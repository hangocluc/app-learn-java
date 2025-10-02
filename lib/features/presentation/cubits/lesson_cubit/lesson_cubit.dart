import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/base.dart';
import '../../../../core/base/src/base_usecase.dart';
import '../../../domain/usecases/src/lesson_usecase.dart';
import 'lesson_state.dart';

class LessonCubit extends Cubit<LessonState> {
  final LessonUsecase usecase;
  LessonCubit({required this.usecase}) : super(LessonStateInitial());

  Future<void> loadLessons() async {
    emit(LessonStateLoading());
    final result = await usecase.call(NoParams());
    result.fold(
      (e) => emit(LessonStateFailure(e.toString())),
      (data) => emit(LessonStateSuccess(data)),
    );
  }
}
