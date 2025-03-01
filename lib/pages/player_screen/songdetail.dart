import 'package:flutter/material.dart';
import 'package:music_player/pages/player_screen/song.dart';

class SongDetails extends StatelessWidget {
  final Song song;

  const SongDetails({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title ve artist artık song parametresinden alınıyor
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
