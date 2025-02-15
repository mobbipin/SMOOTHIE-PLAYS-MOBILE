class SongApiModel {
  final String id;
  final String title;
  final String artist;
  final String audioUrl;
  final String imageUrl;
  final int duration;
  final String? albumId;

  SongApiModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.audioUrl,
    required this.imageUrl,
    required this.duration,
    this.albumId,
  });

  factory SongApiModel.fromJson(Map<String, dynamic> json) {
    return SongApiModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      artist: json['artist'] ?? '',
      audioUrl: json['audioUrl'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      duration: json['duration'] ?? 0,
      albumId: json['albumId'],
    );
  }
}
