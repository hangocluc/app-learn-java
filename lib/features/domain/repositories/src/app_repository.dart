import 'package:learn_java/features/domain/entities/src/program/program_model.dart';

import '../../../../core/base/src/api_response.dart';
import '../../../data/models/demo_model/demo_model.dart';

abstract class AppRepository {
  Future<ApiResponse?> getDemo({
    String? username,
  });
  Future<ApiResponse?> login({
    required String email,
    required String password,
  });
}
