import 'package:learn_java/features/domain/entities/program_model.dart';
import 'package:learn_java/features/domain/repositories/repositories.dart';

import '../../../../../core/base/src/api_response.dart';
import '../../../models/models.dart';
import '../../../providers/network_service/src/demo_service.dart';

class AppRepositoryImpl implements AppRepository {
  final AppService appService;

  AppRepositoryImpl({required this.appService});

  @override
  Future<ApiResponse<DemoModel>?> getDemo({String? username}) async {
    try {
      final response = await appService.demo();
      if (response.isSuccessResponse) {
        return response;
      }
      throw Exception(response.message);
    } catch (error) {
      rethrow;
    }
  }

  Future<ApiResponse?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await appService.login(
        {
          'email': email,
          'password': password,
        },
      );
      if (response.isSuccessResponse) {
        return response;
      }
      throw Exception(response.message);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<ProgramModel>> getPrograms() async {
    try {
      final response = await appService.getProgram();
      return response.map((e) => e.toDomain()).toList();
    } catch (error) {
      rethrow;
    }
  }
}
