class AlbumApiModel {
  final String id;
  final String title;
  final String artist;
  final String imageUrl;
  final int releaseYear;
  final List<String> songs;

  AlbumApiModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.releaseYear,
    required this.songs,
  });

  factory AlbumApiModel.fromJson(Map<String, dynamic> json) {
    return AlbumApiModel(
      id: json['id'],
      title: json['title'],
      artist: json['artist'],
      imageUrl: json['imageUrl'],
      releaseYear: json['releaseYear'],
      songs: List<String>.from(json['songs']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'imageUrl': imageUrl,
      'releaseYear': releaseYear,
      'songs': songs,
    };
  }
}
