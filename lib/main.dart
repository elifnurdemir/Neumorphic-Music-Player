import 'package:flutter/material.dart';
import 'package:music_player/constants/gradient_bg.dart';
import 'package:music_player/pages/player_screen/albumcover.dart';
import 'package:music_player/constants/custom_appbar.dart';
import 'package:music_player/pages/player_screen/controls.dart';
import 'package:music_player/pages/player_screen/progressbar.dart';
import 'package:music_player/pages/player_screen/songdetail.dart';

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
        decoration: const BoxDecoration(gradient: GradientBG.background),
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
