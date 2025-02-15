import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:smoothie_plays_mobile/common/widgets/appbar/app_bar.dart';
import 'package:smoothie_plays_mobile/core/configs%20/theme/app_colors.dart';
import 'package:smoothie_plays_mobile/domain/entities/song/song_entity.dart';

class SongPlayerPage extends StatefulWidget {
  final Song song;
  const SongPlayerPage({Key? key, required this.song}) : super(key: key);

  @override
  _SongPlayerPageState createState() => _SongPlayerPageState();
}

class _SongPlayerPageState extends State<SongPlayerPage> {
  late AudioPlayer _audioPlayer;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      // Load the audio from the song's URL.
      await _audioPlayer.setUrl(widget.song.audioUrl);
      _duration = _audioPlayer.duration ?? Duration.zero;
      _audioPlayer.positionStream.listen((pos) {
        setState(() {
          _position = pos;
        });
      });
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlay() async {
    if (_audioPlayer.playing) {
      await _audioPlayer.pause();
      setState(() => _isPlaying = false);
    } else {
      await _audioPlayer.play();
      setState(() => _isPlaying = true);
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text(widget.song.title),
        action: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_rounded),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            // Song cover image.
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.song.imageUrl),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Song details.
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.song.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.song.artist,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Audio progress slider.
            Slider(
              value: _position.inSeconds.toDouble(),
              min: 0.0,
              max: _duration.inSeconds > 0
                  ? _duration.inSeconds.toDouble()
                  : 1.0,
              onChanged: (value) {
                _audioPlayer.seek(Duration(seconds: value.toInt()));
              },
            ),
            // Time labels.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_formatDuration(_position)),
                Text(_formatDuration(_duration)),
              ],
            ),
            const SizedBox(height: 20),
            // Play/Pause button.
            GestureDetector(
              onTap: _togglePlay,
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
