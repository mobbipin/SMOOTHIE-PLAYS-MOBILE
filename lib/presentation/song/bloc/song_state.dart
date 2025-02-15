import 'package:smoothie_plays_mobile/domain/entities/song/song_entity.dart';

abstract class SongState {}

class SongInitial extends SongState {}

class SongLoading extends SongState {}

class SongLoaded extends SongState {
  final List<Song> songs;
  SongLoaded({required this.songs});
}

class SongOperationSuccess extends SongState {}

class SongOperationFailure extends SongState {
  final String error;
  SongOperationFailure({required this.error});
}
