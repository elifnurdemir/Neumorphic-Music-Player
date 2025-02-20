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
      extendBodyBehindAppBar: true,

      appBar: const CustomAppBar(),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 105, 108, 124),
              Color.fromARGB(255, 42, 43, 49),
              Color.fromARGB(255, 16, 17, 21),
            ],
          ),
        ),

        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              AlbumCover(),
              SizedBox(height: 100),
              SongDetails(),
              SizedBox(height: 50),
              MusicProgressBar(),
              SizedBox(height: 50),
              MusicControls(),
            ],
          ),
        ),
      ),
    );
  }
}
