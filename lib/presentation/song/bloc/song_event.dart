abstract class SongEvent {}

class FetchSongs extends SongEvent {}

class CreateSongEvent extends SongEvent {
  final Map<String, dynamic> songData;
  final List<dynamic> files;
  CreateSongEvent({required this.songData, required this.files});
}

class UpdateSongEvent extends SongEvent {
  final String id;
  final Map<String, dynamic> songData;
  final List<dynamic>? files;
  UpdateSongEvent({required this.id, required this.songData, this.files});
}

class DeleteSongEvent extends SongEvent {
  final String id;
  DeleteSongEvent({required this.id});
}
