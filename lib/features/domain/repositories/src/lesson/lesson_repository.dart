import '../../../../../core/base/src/api_response.dart';
import 'package:learn_java/features/domain/entities/src/lesson/lesson_entity.dart';

abstract class LessonRepository {
  Future<ApiResponse<List<LessonEntity>>?> getAllLessons();
}
