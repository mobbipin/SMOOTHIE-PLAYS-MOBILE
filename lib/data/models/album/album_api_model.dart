class AlbumApiModel {
  final String id;
  final String title;
  final String artist;
  final String imageUrl;
  final int releaseYear;

  AlbumApiModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.releaseYear,
  });

  factory AlbumApiModel.fromJson(Map<String, dynamic> json) {
    return AlbumApiModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      artist: json['artist'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      releaseYear: json['releaseYear'] ?? 0,
    );
  }
}
