import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/network_info.dart';
import '../../data/datasources/local/local_storage.dart';
import '../../data/datasources/remote/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/theme_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/theme_repository.dart';
import '../../domain/usecases/auth/login_usecase.dart';
import '../../domain/usecases/auth/register_usecase.dart';
import '../../domain/usecases/auth/validate_pin_usecase.dart';
import '../../domain/usecases/theme/get_theme_usecase.dart';
import '../../domain/usecases/theme/set_theme_usecase.dart';
import '../../presentation/stores/auth/auth_store.dart';
import '../../presentation/stores/theme/theme_store.dart';

final sl = GetIt.instance;

/// Configura todas as dependências da aplicação
Future<void> init() async {
  //! Features - Auth
  // Stores
  sl.registerFactory(() => AuthStore(
    loginUseCase: sl(),
    registerUseCase: sl(),
    validatePinUseCase: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => ValidatePinUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localStorage: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );

  //! Features - Theme
  // Stores
  sl.registerLazySingleton(() => ThemeStore(
    getThemeUseCase: sl(),
    setThemeUseCase: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => GetThemeUseCase(sl()));
  sl.registerLazySingleton(() => SetThemeUseCase(sl()));

  // Repository
  sl.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(localStorage: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  sl.registerLazySingleton<LocalStorage>(() => LocalStorageImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
