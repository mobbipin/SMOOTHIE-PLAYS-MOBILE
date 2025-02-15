import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/data/datasources/remote/song_remote_datasource.dart';
import 'package:smoothie_plays_mobile/domain/entities/song/song_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/song/song_repository.dart';

class SongRemoteRepositoryImpl implements SongRepository {
  final SongRemoteDataSource remoteDataSource;

  SongRemoteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<SongEntity>> fetchSongs() async {
    final songApiModels = await remoteDataSource.fetchSongs();
    return songApiModels
        .map((model) => SongEntity(
              id: model.id ?? '',
              title: model.title ?? 'Unknown Title',
              artist: model.artist ?? 'Unknown Artist',
              audioUrl: model.audioUrl ?? '',
              imageUrl: model.imageUrl ?? '',
              duration: model.duration ?? 0, // Use 0 if null
              albumId: model.albumId, // Assuming albumId can be null
            ))
        .toList();
  }

  @override
  Future<SongEntity> createSong(Map<String, dynamic> songData,
      {http.MultipartFile? audioFile, http.MultipartFile? imageFile}) async {
    final model = await remoteDataSource.createSong(songData,
        audioFile: audioFile, imageFile: imageFile);
    return SongEntity(
      id: model.id,
      title: model.title,
      artist: model.artist,
      audioUrl: model.audioUrl,
      imageUrl: model.imageUrl,
      duration: model.duration,
      albumId: model.albumId,
    );
  }
}
