import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/data/datasources/remote/album_remote_datasource.dart';
import 'package:smoothie_plays_mobile/domain/entities/albums/album_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/album/album_repository.dart';

class AlbumRemoteRepositoryImpl implements AlbumRepository {
  final AlbumRemoteDataSource remoteDataSource;

  AlbumRemoteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<AlbumEntity>> fetchAlbums() async {
    final albumApiModels = await remoteDataSource.fetchAlbums();
    return albumApiModels
        .map((model) => AlbumEntity(
              id: model.id,
              title: model.title,
              artist: model.artist,
              imageUrl: model.imageUrl,
              releaseYear: model.releaseYear,
            ))
        .toList();
  }

  @override
  Future<AlbumEntity> createAlbum(Map<String, dynamic> albumData,
      {http.MultipartFile? imageFile}) async {
    final model =
        await remoteDataSource.createAlbum(albumData, imageFile: imageFile);
    return AlbumEntity(
      id: model.id,
      title: model.title,
      artist: model.artist,
      imageUrl: model.imageUrl,
      releaseYear: model.releaseYear,
    );
  }
}
