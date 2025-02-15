import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/domain/entities/albums/album_entity.dart';

abstract class AlbumRepository {
  Future<List<AlbumEntity>> fetchAlbums();
  Future<AlbumEntity> createAlbum(
    Map<String, dynamic> albumData, {
    http.MultipartFile? imageFile,
  });
}
