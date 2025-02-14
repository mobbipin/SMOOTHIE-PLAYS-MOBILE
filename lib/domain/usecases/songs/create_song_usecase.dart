import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/domain/entities/song/song_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/song/song_repository.dart';

class CreateSongUseCase {
  final SongRepository repository;

  CreateSongUseCase({required this.repository});

  Future<SongEntity> call(
    Map<String, dynamic> songData, {
    http.MultipartFile? audioFile,
    http.MultipartFile? imageFile,
  }) async {
    return await repository.createSong(
      songData,
      audioFile: audioFile,
      imageFile: imageFile,
    );
  }
}
