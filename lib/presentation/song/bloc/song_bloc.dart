import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoothie_plays_mobile/domain/usecases/songs/create_song_usecase.dart';
import 'package:smoothie_plays_mobile/domain/usecases/songs/delete_song_usecase.dart';
import 'package:smoothie_plays_mobile/domain/usecases/songs/get_songs_usecase.dart';
import 'package:smoothie_plays_mobile/domain/usecases/songs/update_song_usecase.dart';

import 'song_event.dart';
import 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final GetSongs getSongs;
  final CreateSong createSong;
  final UpdateSong updateSong;
  final DeleteSong deleteSong;

  SongBloc({
    required this.getSongs,
    required this.createSong,
    required this.updateSong,
    required this.deleteSong,
  }) : super(SongInitial()) {
    on<FetchSongs>(_onFetchSongs);
    on<CreateSongEvent>(_onCreateSong);
    on<UpdateSongEvent>(_onUpdateSong);
    on<DeleteSongEvent>(_onDeleteSong);
  }

  Future<void> _onFetchSongs(FetchSongs event, Emitter<SongState> emit) async {
    emit(SongLoading());
    try {
      final songs = await getSongs();
      emit(SongLoaded(songs: songs));
    } catch (e) {
      emit(SongOperationFailure(error: e.toString()));
    }
  }

  Future<void> _onCreateSong(
      CreateSongEvent event, Emitter<SongState> emit) async {
    emit(SongLoading());
    try {
      await createSong(event.songData, files: event.files);
      add(FetchSongs());
    } catch (e) {
      emit(SongOperationFailure(error: e.toString()));
    }
  }

  Future<void> _onUpdateSong(
      UpdateSongEvent event, Emitter<SongState> emit) async {
    emit(SongLoading());
    try {
      await updateSong(event.id, event.songData, files: event.files);
      add(FetchSongs());
    } catch (e) {
      emit(SongOperationFailure(error: e.toString()));
    }
  }

  Future<void> _onDeleteSong(
      DeleteSongEvent event, Emitter<SongState> emit) async {
    emit(SongLoading());
    try {
      await deleteSong(event.id);
      add(FetchSongs());
    } catch (e) {
      emit(SongOperationFailure(error: e.toString()));
    }
  }
}
