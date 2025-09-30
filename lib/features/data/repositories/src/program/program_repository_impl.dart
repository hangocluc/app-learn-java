import 'package:learn_java/features/data/providers/program_service/program_service.dart';
import 'package:learn_java/features/domain/entities/src/program/program_detail.dart';
import 'package:learn_java/features/domain/entities/src/program/program_model.dart';
import 'package:learn_java/features/domain/repositories/src/program/program_repository.dart';

class ProgramRepositoryImpl implements ProgramRepository {
  final ProgramService service;

  ProgramRepositoryImpl({required this.service});

  @override
  Future<List<ProgramModel>> getPrograms() async {
    try {
      final response = await service.getProgram();
      return response.map((e) => e.toDomain()).toList();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<ProgramDetail>> getProgramDetail(String programId) async {
    try {
      final response = await service.getProgramDetail(programId);
      return response.map((e) => e.toDomain()).toList();
    } catch (error) {
      rethrow;
    }
  }
}
