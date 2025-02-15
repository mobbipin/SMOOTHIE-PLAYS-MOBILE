import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/core/configs%20/constants/api_endpoints.dart';
import 'package:smoothie_plays_mobile/data/models/album/album_api_model.dart';

abstract class AlbumRemoteDataSource {
  Future<List<AlbumApiModel>> fetchAlbums();
  Future<AlbumApiModel> createAlbum(Map<String, dynamic> albumData,
      {http.MultipartFile? imageFile});
}

class AlbumRemoteDataSourceImpl implements AlbumRemoteDataSource {
  final http.Client client;

  AlbumRemoteDataSourceImpl({required this.client});

  @override
  Future<List<AlbumApiModel>> fetchAlbums() async {
    final response =
        await client.get(Uri.parse('${ApiEndpoints.baseUrl}/albums'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList
          .map((jsonItem) => AlbumApiModel.fromJson(jsonItem))
          .toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }

  @override
  Future<AlbumApiModel> createAlbum(Map<String, dynamic> albumData,
      {http.MultipartFile? imageFile}) async {
    var uri = Uri.parse('${ApiEndpoints.baseUrl}/albums');
    var request = http.MultipartRequest('POST', uri);
    request.fields
        .addAll(albumData.map((key, value) => MapEntry(key, value.toString())));
    if (imageFile != null) request.files.add(imageFile);

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 201) {
      return AlbumApiModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create album');
    }
  }
}
