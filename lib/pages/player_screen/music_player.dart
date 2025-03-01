import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/constants/gradient_bg.dart';
import 'package:music_player/data/song_data.dart';
import 'package:music_player/pages/player_screen/album_cover.dart';
import 'package:music_player/constants/custom_appbar.dart';
import 'package:music_player/pages/player_screen/music_controls.dart';
import 'package:music_player/pages/player_screen/song.dart';
import 'package:music_player/pages/player_screen/songdetail.dart';
// song_data.dart dosyasını import edin

class MusicPlayer extends StatefulWidget {
  final Song? song;
  const MusicPlayer({super.key, this.song});

  @override
  MusicPlayerState createState() => MusicPlayerState();
}

class MusicPlayerState extends State<MusicPlayer> {
  late AudioPlayer _audioPlayer;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  Duration get duration => _duration;
  Duration get position => _position;

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
    // Burada song_data.dart dosyasındaki ilk şarkıyı alıyoruz
    final song =
        PlaylistData.songs.isNotEmpty
            ? PlaylistData.songs[0]
            : Song(title: 'Sample Song', artist: 'Sample Artist', filePath: '');

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
              // SongDetails widget'ına song verisini geçiyoruz
              SongDetails(song: song),
              const SizedBox(height: 50),
              MusicControls(),
            ],
          ),
        ),
      ),
    );
  }
}
