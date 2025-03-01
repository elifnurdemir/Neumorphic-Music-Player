import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/constants/gradient_bg.dart';
import 'package:music_player/pages/player_screen/albumcover.dart';
import 'package:music_player/constants/custom_appbar.dart';
import 'package:music_player/pages/player_screen/controls.dart';
import 'package:music_player/pages/player_screen/songdetail.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  MusicPlayerState createState() => MusicPlayerState();
}

class MusicPlayerState extends State<MusicPlayer> {
  late AudioPlayer _audioPlayer;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Set up audio player listeners
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  // Seek işlemi için
  void onSeek(Duration value) {
    _audioPlayer.seek(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: Container(
        decoration: const BoxDecoration(gradient: GradientBG.background),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              const AlbumCover(),
              const SizedBox(height: 100),
              SongDetails(),
              const SizedBox(height: 50),
              MusicControls(),
            ],
          ),
        ),
      ),
    );
  }
}
