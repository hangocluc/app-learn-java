import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../core/interceptor/auth_interceptor.dart';
import '../../../core/interceptor/error_interceptor.dart';
import '../../../core/interceptor/unauth_interceptor.dart';
import '../../../main.dart';
import '../../data/providers/network_service/src/demo_service.dart';
import '../app_env/env.dart';
import '../app_env/network_env.dart';

Future<void> registerNetworkDependencies(GetIt sl) async {
  final env = sl.get<Env>().envNetwork;
  final isProduction = sl.get<Env>().isProduction;
  final dioOption = BaseOptions(
    baseUrl: env.apiServer,
    connectTimeout: Duration(seconds: env.apiConnectTimeout),
    receiveTimeout: Duration(seconds: env.apiReceiverTimeout),
    sendTimeout: Duration(seconds: env.apiSendTimeout),
    contentType: env.apiContentType,
    followRedirects: true,
    validateStatus: (status) {
      return status != null && status < 500;
    },
  );

  sl.registerLazySingleton<Dio>(
    () => Dio(dioOption),
    instanceName: INSTANCE_AUTH_DIO,
  );
  sl.registerLazySingleton<Dio>(
    () => Dio(dioOption),
    instanceName: INSTANCE_UNAUTH_DIO,
  );

  sl.get<Dio>(instanceName: INSTANCE_AUTH_DIO).interceptors.addAll([
    HandleErrorInterceptor(),
    AuthInterceptor(),
  ]);
  sl.get<Dio>(instanceName: INSTANCE_UNAUTH_DIO).interceptors.addAll([
    HandleErrorInterceptor(),
    UnauthInterceptor(),
  ]);
  // if (!isProduction && alice != null) {
  //   sl
  //       .get<Dio>(instanceName: INSTANCE_AUTH_DIO)
  //       .interceptors
  //       .add(alice!.getDioInterceptor());
  //   sl
  //       .get<Dio>(instanceName: INSTANCE_UNAUTH_DIO)
  //       .interceptors
  //       .add(alice!.getDioInterceptor());
  // }

  // initial service
  sl.registerFactory<DemoService>(
    () => DemoService(
      sl.get<Dio>(instanceName: INSTANCE_UNAUTH_DIO),
    ),
  );
}
