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
      // Always return mock data since API endpoint doesn't exist
      return _getMockPrograms();
    }
  }

  @override
  Future<List<ProgramDetail>> getProgramDetail(String programId) async {
    try {
      final response = await service.getProgramDetail(programId);
      return response.map((e) => e.toDomain()).toList();
    } catch (error) {
      // Always return mock data since API endpoint doesn't exist
      return _getMockProgramDetails(programId);
    }
  }

  List<ProgramModel> _getMockPrograms() {
    return [
      ProgramModel(
        id: '1',
        name: 'Java Cơ Bản',
        image:
            'https://via.placeholder.com/200x150/4A90E2/FFFFFF?text=Java+Basic',
      ),
      ProgramModel(
        id: '2',
        name: 'Java Nâng Cao',
        image:
            'https://via.placeholder.com/200x150/50C878/FFFFFF?text=Java+Advanced',
      ),
      ProgramModel(
        id: '3',
        name: 'Spring Framework',
        image: 'https://via.placeholder.com/200x150/FF6B6B/FFFFFF?text=Spring',
      ),
      ProgramModel(
        id: '4',
        name: 'Android Development',
        image: 'https://via.placeholder.com/200x150/9B59B6/FFFFFF?text=Android',
      ),
    ];
  }

  List<ProgramDetail> _getMockProgramDetails(String programId) {
    return [
      ProgramDetail(
        id: '1',
        programId: programId,
        title:
            'Giới thiệu về ${programId == '1' ? 'Java Cơ Bản' : 'Chương trình'}',
        content:
            'Đây là nội dung chi tiết về chương trình học. Bạn sẽ được học các khái niệm cơ bản và thực hành với các bài tập thực tế.',
      ),
      ProgramDetail(
        id: '2',
        programId: programId,
        title: 'Cài đặt môi trường',
        content:
            'Hướng dẫn cài đặt JDK, IDE và các công cụ cần thiết để bắt đầu lập trình Java.',
      ),
      ProgramDetail(
        id: '3',
        programId: programId,
        title: 'Cú pháp cơ bản',
        content:
            'Tìm hiểu về cú pháp Java, cách khai báo biến, hàm và các cấu trúc điều khiển cơ bản.',
      ),
    ];
  }
}
