import 'package:get_it/get_it.dart';
import 'package:vandshop_front_app/src/core/network/dio_service.dart';
import 'package:vandshop_front_app/src/core/network/logger.dart';
import 'package:vandshop_front_app/src/core/routes/app_router.dart';
import 'package:dio/dio.dart';
import 'package:vandshop_front_app/src/core/network/network_logger.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // Register AppRouter
  locator.registerLazySingleton(() => AppRouter());

  // Network Services
  locator.registerSingleton(Dio());
  locator.registerSingleton(DioService());
  locator.registerSingleton(SimpleLogPrinter());
  locator.registerSingleton(Logging());
}
