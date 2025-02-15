import 'package:smoothie_plays_mobile/domain/entities/song/song_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/song/song_repository.dart';

class GetSongs {
  final SongRepository repository;

  GetSongs(this.repository);

  Future<List<Song>> call() async {
    return await repository.getSongs();
  }
}
