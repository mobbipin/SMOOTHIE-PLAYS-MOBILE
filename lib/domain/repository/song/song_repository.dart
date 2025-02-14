import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/domain/entities/song/song_entity.dart';

abstract class SongRepository {
  Future<List<SongEntity>> fetchSongs();
  Future<SongEntity> createSong(
    Map<String, dynamic> songData, {
    http.MultipartFile? audioFile,
    http.MultipartFile? imageFile,
  });
}
