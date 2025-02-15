import 'package:smoothie_plays_mobile/domain/entities/song/song_entity.dart';

abstract class SongRepository {
  Future<List<Song>> getSongs();
  Future<Song> createSong(Map<String, dynamic> songData,
      {required List<dynamic> files});
  Future<void> updateSong(String id, Map<String, dynamic> songData,
      {List<dynamic>? files});
  Future<void> deleteSong(String id);
}
