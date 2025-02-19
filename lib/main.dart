import 'package:flutter/material.dart';
import 'package:music_player/albumcover.dart';
import 'package:music_player/appbar.dart';
import 'package:music_player/controls.dart';
import 'package:music_player/progressbar.dart';
import 'package:music_player/songdetail.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: MusicPlayer()),
  );
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: const Color(0xFF212121),
      body: const Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            AlbumCover(),
            SizedBox(height: 60),
            SongDetails(),
            SizedBox(height: 60),
            MusicProgressBar(),
            SizedBox(height: 80),
            MusicControls(),
          ],
        ),
      ),
    );
  }
}
