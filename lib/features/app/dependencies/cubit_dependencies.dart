import 'package:get_it/get_it.dart';

import '../../presentation/cubits/demo_cubit/demo_cubit.dart';

Future<void> registerCubitDI(GetIt sl) async {
  sl.registerLazySingleton(
    () => DemoCubit(usecase: sl.get(), sharedPreferences: sl.get()),
  );
}
