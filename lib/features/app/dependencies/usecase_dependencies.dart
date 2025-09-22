import 'package:get_it/get_it.dart';
import '../../domain/usecases/usecase.dart';

Future<void> registerUseCaseDI(GetIt sl) async {
  sl.registerFactory(
    () => DemoUsecase(repository: sl.get()),
  );
}
