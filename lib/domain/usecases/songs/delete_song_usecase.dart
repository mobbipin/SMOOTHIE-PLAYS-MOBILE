import 'package:smoothie_plays_mobile/domain/repository/song/song_repository.dart';

class DeleteSong {
  final SongRepository repository;

  DeleteSong(this.repository);

  Future<void> call(String id) async {
    await repository.deleteSong(id);
  }
}
