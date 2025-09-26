import '../../../../../core/base/src/api_response.dart';
import '../../../../domain/repositories/src/authentication/demo_repository.dart';
import '../../../models/models.dart';
import '../../../providers/network_service/src/demo_service.dart';

class DemoRepositoryImpl implements DemoRepository {
  final DemoService demoService;

  DemoRepositoryImpl({required this.demoService});

  @override
  Future<ApiResponse<DemoModel>?> getDemo({String? username}) async {
    try {
      final response = await demoService.demo();
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
      final response = await demoService.login(email, password);
      if (response.isSuccessResponse) {
        return response;
      }
      throw Exception(response.message);
    } catch (error) {
      rethrow;
    }
  }
}
