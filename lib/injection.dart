import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/data/datasources/remote/auth_remote_datasource.dart';
import 'package:smoothie_plays_mobile/data/repository/auth_remote_repository_impl.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // HTTP Client
  getIt.registerLazySingleton(() => http.Client());

  // Data Sources
  getIt.registerLazySingleton(() => AuthRemoteDataSource(client: getIt()));

  // Repositories
  getIt.registerLazySingleton(() => AuthRemoteRepositoryImpl(
        remoteDataSource: getIt(),
      ));
}
