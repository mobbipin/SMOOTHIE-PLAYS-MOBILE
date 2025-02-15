class Song {
  final String id;
  final String title;
  final String artist;
  final String imageUrl;
  final String audioUrl;
  final int duration;
  final String? albumId;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.audioUrl,
    required this.duration,
    this.albumId,
  });
}
