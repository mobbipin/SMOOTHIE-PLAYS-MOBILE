import 'package:smoothie_plays_mobile/data/datasources/remote/song_remote_datasource.dart';
import 'package:smoothie_plays_mobile/data/models/songs/song_api_model.dart';
import 'package:smoothie_plays_mobile/domain/entities/song/song_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/song/song_repository.dart';

class SongRemoteRepositoryImpl implements SongRepository {
  final RemoteSongDataSource remoteSongDataSource;

  SongRemoteRepositoryImpl({required this.remoteSongDataSource});

  @override
  Future<List<Song>> getSongs() async {
    final songApiModels = await remoteSongDataSource.fetchSongs();
    return songApiModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Song> createSong(
    Map<String, dynamic> songData, {
    required List<dynamic> files,
  }) async {
    final songApiModel = await remoteSongDataSource.createSong(
      songData,
      files: files.cast(),
    );
    return songApiModel.toEntity();
  }

  @override
  Future<void> updateSong(
    String id,
    Map<String, dynamic> songData, {
    List<dynamic>? files,
  }) async {
    await remoteSongDataSource.updateSong(id, songData, files: files?.cast());
  }

  @override
  Future<void> deleteSong(String id) async {
    await remoteSongDataSource.deleteSong(id);
  }
}
