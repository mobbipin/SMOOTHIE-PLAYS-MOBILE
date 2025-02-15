import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/data/models/song_api_model.dart';
import 'package:smoothie_plays_mobile/core/configs/assets/api_endpoints.dart';

abstract class SongRemoteDataSource {
  Future<List<SongApiModel>> fetchSongs();
  Future<SongApiModel> createSong(Map<String, dynamic> songData, {http.MultipartFile? audioFile, http.MultipartFile? imageFile});
}

class SongRemoteDataSourceImpl implements SongRemoteDataSource {
  final http.Client client;

  SongRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SongApiModel>> fetchSongs() async {
    final response = await client.get(Uri.parse('${ApiEndpoints.baseUrl}/songs'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((jsonItem) => SongApiModel.fromJson(jsonItem)).toList();
    } else {
      throw Exception('Failed to load songs');
    }
  }

  @override
  Future<SongApiModel> createSong(Map<String, dynamic> songData, {http.MultipartFile? audioFile, http.MultipartFile? imageFile}) async {
    var uri = Uri.parse('${ApiEndpoints.baseUrl}/songs');
    var request = http.MultipartRequest('POST', uri);
    request.fields.addAll(songData.map((key, value) => MapEntry(key, value.toString())));
    if (audioFile != null) request.files.add(audioFile);
    if (imageFile != null) request.files.add(imageFile);
    
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 201) {
      return SongApiModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create song');
    }
  }
}
