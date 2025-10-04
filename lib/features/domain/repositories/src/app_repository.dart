import '../../../../core/base/src/api_response.dart';
import '../../../data/models/src/user_model.dart';

abstract class AppRepository {
  Future<ApiResponse?> getDemo({
    String? username,
  });
  Future<ApiResponse?> login({
    required String email,
    required String password,
  });

  Future<ApiResponse<UserModel>?> getOrCreateNewUser(UserModel user);

  Future<ApiResponse<UserModel>?> getUserInfo(String gmail);
}
