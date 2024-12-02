import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smoothie Plays',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SongListPage(),
    );
  }
}

class SongListPage extends StatefulWidget {
  const SongListPage({super.key});

  @override
  _SongListPageState createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  List<dynamic> songs = [];

  @override
  void initState() {
    super.initState();
    fetchSongs();
  }

  Future<void> fetchSongs() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:5000/api/songs'));
      if (response.statusCode == 200) {
        setState(() {
          songs = json.decode(response.body);
        });
      } else {
        print('Error fetching songs: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smoothie Plays'),
      ),
      body: songs.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return ListTile(
                  title: Text(song['title']),
                  subtitle: Text(
                      '${song['artist']} (${(song['duration'] / 60).floor()}:${song['duration'] % 60})'),
                );
              },
            ),
    );
  }
}
