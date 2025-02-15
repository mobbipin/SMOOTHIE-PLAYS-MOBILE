import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoothie_plays_mobile/presentation/song/bloc/song_bloc.dart';
import 'package:smoothie_plays_mobile/presentation/song/bloc/song_state.dart';

class SongPage extends StatelessWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongBloc, SongState>(
      builder: (context, state) {
        if (state is SongLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SongLoaded) {
          final songs = state.songs;
          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return ListTile(
                leading: Image.network(song.imageUrl),
                title: Text(song.title),
                subtitle: Text(song.artist),
                onTap: () {
                  // Navigate to player page
                },
              );
            },
          );
        } else if (state is SongOperationFailure) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return Container();
      },
    );
  }
}
