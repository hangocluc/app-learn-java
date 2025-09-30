import 'package:get_it/get_it.dart';
import '../../domain/usecases/usecase.dart';
import '../../domain/usecases/src/profile/profile_usecase.dart' as profile_uc;

Future<void> registerUseCaseDI(GetIt sl) async {
  sl.registerFactory<DemoUsecase>(
    () => DemoUsecase(repository: sl.get()),
  );

  sl.registerFactory<profile_uc.ProfileUsecase>(
    () => profile_uc.ProfileUsecase(repository: sl.get()),
  );
}
