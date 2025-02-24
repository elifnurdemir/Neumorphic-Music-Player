import 'package:flutter/material.dart';
import 'package:music_player/pages/player_screen/song.dart';

class SongDetails extends StatelessWidget {
  final Song song = Song(
    title: "Sarki Adi",
    artist: "Sarkici Adi",
    imageUrl: "assets/images/album_cover.jpg",
  );

  SongDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          song.title,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(
          song.artist,
          style: const TextStyle(fontSize: 18, color: Colors.white70),
        ),
      ],
    );
  }
}
