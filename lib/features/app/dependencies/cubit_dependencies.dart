import 'package:get_it/get_it.dart';

import '../../presentation/cubits/demo_cubit/demo_cubit.dart';
import '../../presentation/cubits/profile_cubit/profile_cubit.dart';
import '../../domain/usecases/src/profile/profile_usecase.dart' as profile_uc;

Future<void> registerCubitDI(GetIt sl) async {
  sl.registerLazySingleton(
    () => DemoCubit(usecase: sl.get(), sharedPreferences: sl.get()),
  );

  sl.registerLazySingleton(
    () => ProfileCubit(usecase: sl.get<profile_uc.ProfileUsecase>()),
  );
}
