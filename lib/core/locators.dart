import 'package:flutter_test_guia/controllers/navigation_controller.dart';
import 'package:flutter_test_guia/ui/shared/custom_snack.dart';
import 'package:get_it/get_it.dart';
import '../controllers/motel/motel_controller.dart';
import '../data/repositories/motel_repository.dart';
import '../data/repositories/motel_repository_interface.dart';
import '../data/sources/motel_remote_data_source.dart';
import 'custom_client_http.dart';

final locator = GetIt.instance;

void setupLocators() {
  locator.registerLazySingleton<CustomHttpClient>(() => CustomHttpClient());

  locator.registerLazySingleton<MotelRemoteDataSource>(
    () => MotelRemoteDataSource(client: locator<CustomHttpClient>().client),
  );

  locator.registerLazySingleton<CustomSnack>(
    () => CustomSnack(),
  );

  locator.registerLazySingleton<NavigationController>(
    () => NavigationController(),
  );

  locator.registerLazySingleton<MotelRepositoryInterface>(
    () => MotelRepository(
      remoteDataSource: locator<MotelRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton<MotelController>(
    () => MotelController(
      motelRepository: locator<MotelRepositoryInterface>(),
    ),
  );
}
