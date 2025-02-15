import 'package:smoothie_plays_mobile/domain/entities/song/song_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/song/song_repository.dart';

class CreateSong {
  final SongRepository repository;

  CreateSong(this.repository);

  Future<Song> call(Map<String, dynamic> songData,
      {required List<dynamic> files}) async {
    return await repository.createSong(songData, files: files);
  }
}
