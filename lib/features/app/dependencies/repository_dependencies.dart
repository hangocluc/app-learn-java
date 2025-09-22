import 'package:get_it/get_it.dart';

import '../../data/repositories/src/demo/demo_repository_impl.dart';
import '../../domain/repositories/src/authentication/demo_repository.dart';

Future<void> registerRepositoryDI(GetIt sl) async {
  sl.registerFactory<DemoRepository>(
    () => DemoRepositoryImpl(demoService: sl.get()),
  );
}
