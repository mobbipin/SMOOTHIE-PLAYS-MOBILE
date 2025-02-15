import 'package:smoothie_plays_mobile/domain/repository/song/song_repository.dart';

class UpdateSong {
  final SongRepository repository;

  UpdateSong(this.repository);

  Future<void> call(String id, Map<String, dynamic> songData,
      {List<dynamic>? files}) async {
    await repository.updateSong(id, songData, files: files);
  }
}
