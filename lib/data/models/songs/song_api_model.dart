import 'package:smoothie_plays_mobile/domain/entities/song/song_entity.dart';

class SongApiModel {
  final String id;
  final String title;
  final String artist;
  final String imageUrl;
  final String audioUrl;
  final int duration;
  final String? albumId;

  SongApiModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.audioUrl,
    required this.duration,
    this.albumId,
  });

  factory SongApiModel.fromJson(Map<String, dynamic> json) {
    return SongApiModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      artist: json['artist'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      audioUrl: json['audioUrl'] ?? '',
      duration: json['duration'] ?? 0,
      albumId: json['albumId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'artist': artist,
      'imageUrl': imageUrl,
      'audioUrl': audioUrl,
      'duration': duration,
      'albumId': albumId,
    };
  }
}

extension SongApiModelMapper on SongApiModel {
  Song toEntity() {
    return Song(
      id: id,
      title: title,
      artist: artist,
      imageUrl: imageUrl,
      audioUrl: audioUrl,
      duration: duration,
      albumId: albumId,
    );
  }
}
