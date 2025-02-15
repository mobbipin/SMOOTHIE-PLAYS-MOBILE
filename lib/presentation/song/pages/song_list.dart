import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoothie_plays_mobile/domain/entities/song/song_entity.dart';
import 'package:smoothie_plays_mobile/presentation/player/pages/player.dart';
import 'package:smoothie_plays_mobile/presentation/song/bloc/song_bloc.dart';
import 'package:smoothie_plays_mobile/presentation/song/bloc/song_state.dart';

class SongsList extends StatelessWidget {
  const SongsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongBloc, SongState>(
      builder: (context, state) {
        if (state is SongLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SongLoaded) {
          return SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.songs.length,
              itemBuilder: (context, index) {
                final Song song = state.songs[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to SongPlayerPage for the selected song.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SongPlayerPage(song: song)),
                    );
                  },
                  child: Container(
                    width: 120,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              song.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.error);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          song.title,
                          style: const TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SongOperationFailure) {
          return Center(child: Text("Error: ${state.error}"));
        }
        return Container();
      },
    );
  }
}
