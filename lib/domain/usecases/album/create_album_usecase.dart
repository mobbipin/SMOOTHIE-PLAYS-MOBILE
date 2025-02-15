import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/domain/entities/albums/album_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/album/album_repository.dart';

class CreateAlbumUseCase {
  final AlbumRepository repository;

  CreateAlbumUseCase({required this.repository});

  Future<AlbumEntity> call(
    Map<String, dynamic> albumData, {
    http.MultipartFile? imageFile,
  }) async {
    return await repository.createAlbum(albumData, imageFile: imageFile);
  }
}
