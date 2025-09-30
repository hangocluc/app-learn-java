import 'package:learn_java/features/domain/entities/src/program/program_detail.dart';
import 'package:learn_java/features/domain/entities/src/program/program_model.dart';

abstract class ProgramRepository {
  Future<List<ProgramModel>> getPrograms();
  Future<List<ProgramDetail>> getProgramDetail(String programId);
}
