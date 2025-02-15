import 'package:smoothie_plays_mobile/domain/entities/albums/album_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/album/album_repository.dart';

class GetAlbumsUseCase {
  final AlbumRepository repository;

  GetAlbumsUseCase({required this.repository});

  Future<List<AlbumEntity>> call() async {
    return await repository.fetchAlbums();
  }
}
