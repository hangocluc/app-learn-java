import '../../../../../core/base/src/api_response.dart';
import '../../../../data/models/demo_model/demo_model.dart';

abstract class DemoRepository {
  Future<ApiResponse?> getDemo({
    String? username,
  });
  Future<ApiResponse?> login({
    required String email,
    required String password,
  });
}
