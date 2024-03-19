import 'package:supercoder_test/src/utils/exports.dart';

final sl = GetIt.instance;
Future<void> init() async {
//* BLOC
  sl.registerFactory<CreateCharacterCubit>(() => CreateCharacterCubit(sl()));

//* REMOTE
  sl.registerLazySingleton<CreateCharacterRemoteSource>(
      () => CreateCharacterRemoteSource(sl(), sl()));

//* CORE
  sl.registerLazySingleton(() => LocalSource(sl()));

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => DioClient(sl()));

  sl.registerLazySingleton<InternetInfo>(() => InternetInfoImpl(sl()));

  sl.registerLazySingleton(() => InternetConnection());
}
