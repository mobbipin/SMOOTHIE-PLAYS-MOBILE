import 'package:smoothie_plays_mobile/domain/entities/song/song_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/song/song_repository.dart';

class GetSongsUseCase {
  final SongRepository repository;

  GetSongsUseCase({required this.repository});

  Future<List<SongEntity>> call() async {
    return await repository.fetchSongs();
  }
}
