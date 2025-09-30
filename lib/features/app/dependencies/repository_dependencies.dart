import 'package:get_it/get_it.dart';

import '../../data/repositories/src/demo/app_repository_impl.dart';
import '../../domain/repositories/src/app_repository.dart';

Future<void> registerRepositoryDI(GetIt sl) async {
  sl.registerFactory<AppRepository>(
    () => AppRepositoryImpl(appService: sl.get()),
  );
}
