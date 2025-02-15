import 'package:get_it/get_it.dart';
import 'package:smoothie_plays_mobile/core/configs%20/constants/api_endpoints.dart';
import 'package:smoothie_plays_mobile/data/datasources/remote/song_remote_datasource.dart';
import 'package:smoothie_plays_mobile/data/repository/song_remote_repository_impl.dart';
import 'package:smoothie_plays_mobile/domain/repository/song/song_repository.dart';
import 'package:smoothie_plays_mobile/domain/usecases/songs/create_song_usecase.dart';
import 'package:smoothie_plays_mobile/domain/usecases/songs/delete_song_usecase.dart';
import 'package:smoothie_plays_mobile/domain/usecases/songs/get_songs_usecase.dart';
import 'package:smoothie_plays_mobile/domain/usecases/songs/update_song_usecase.dart';
import 'package:smoothie_plays_mobile/presentation/song/bloc/song_bloc.dart';

final sl = GetIt.instance;

void setupLocator() {
  // Use the base URL defined in ApiEndpoints.
  const String baseUrl = ApiEndpoints.baseUrl;

  // Register the remote data source.
  sl.registerLazySingleton<RemoteSongDataSource>(
    () => RemoteSongDataSource(baseUrl: baseUrl),
  );

  // Register the repository, providing the remote data source.
  sl.registerLazySingleton<SongRepository>(
    () => SongRemoteRepositoryImpl(remoteSongDataSource: sl()),
  );

  // Register use cases.
  sl.registerLazySingleton(() => GetSongs(sl<SongRepository>()));
  sl.registerLazySingleton(() => CreateSong(sl<SongRepository>()));
  sl.registerLazySingleton(() => UpdateSong(sl<SongRepository>()));
  sl.registerLazySingleton(() => DeleteSong(sl<SongRepository>()));

  // Register the SongBloc.
  sl.registerFactory(() => SongBloc(
        getSongs: sl(),
        createSong: sl(),
        updateSong: sl(),
        deleteSong: sl(),
      ));
}
