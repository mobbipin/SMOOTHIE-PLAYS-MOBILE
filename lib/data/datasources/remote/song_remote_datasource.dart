import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/data/models/songs/song_api_model.dart';

class RemoteSongDataSource {
  final String baseUrl;

  RemoteSongDataSource({required this.baseUrl});

  Future<List<SongApiModel>> fetchSongs() async {
    final response = await http.get(Uri.parse('$baseUrl/songs'));
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);

      final List<dynamic> data =
          decoded is List ? decoded : decoded["songs"] ?? [];
      return data.map((json) => SongApiModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load songs');
    }
  }

  Future<SongApiModel> createSong(Map<String, dynamic> songData,
      {required List<http.MultipartFile> files}) async {
    final uri = Uri.parse('$baseUrl/admin/songs');
    var request = http.MultipartRequest('POST', uri);
    songData.forEach((key, value) {
      request.fields[key] = value.toString();
    });
    files.forEach(request.files.add);
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 201) {
      return SongApiModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create song');
    }
  }

  Future<void> updateSong(String id, Map<String, dynamic> songData,
      {List<http.MultipartFile>? files}) async {
    final uri = Uri.parse('$baseUrl/admin/songs/$id');
    var request = http.MultipartRequest('PUT', uri);
    songData.forEach((key, value) {
      request.fields[key] = value.toString();
    });
    if (files != null) files.forEach(request.files.add);
    final streamedResponse = await request.send();
    if (streamedResponse.statusCode != 200) {
      throw Exception('Failed to update song');
    }
  }

  Future<void> deleteSong(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/admin/songs/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete song');
    }
  }
}
