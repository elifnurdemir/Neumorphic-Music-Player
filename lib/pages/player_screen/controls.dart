import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/constants/neumorphic_button.dart';

class MusicControls extends StatefulWidget {
  const MusicControls({super.key});

  @override
  MusicControlsState createState() => MusicControlsState();
}

class MusicControlsState extends State<MusicControls> {
  bool isPlaying = false;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  void togglePlayPause() async {
    try {
      if (isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.play(AssetSource('sounds/powerwolf.mp3'));
      }

      setState(() {
        isPlaying = !isPlaying;
      });
    } catch (e) {
      print("Ses çalma hatası: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // AudioPlayer'ı serbest bırak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Önceki parça butonu
        NeumorphicButton(
          icon: Icons.skip_previous,
          iconSize: 35,
          bgColor: const Color(0xFF2E2E2E),
          padding: const EdgeInsets.all(16),
          onPressed: () {},
        ),
        const SizedBox(width: 20),
        // Oynatma / Duraklatma butonu (Ana buton)
        NeumorphicButton(
          icon:
              isPlaying
                  ? Icons.pause
                  : Icons.play_arrow, // Duruma göre ikon değişir
          iconSize: 50,
          bgColor: const Color(0xFF26A69A),
          padding: const EdgeInsets.all(20),
          onPressed:
              togglePlayPause, // Butona tıklandığında togglePlayPause çağrılır
        ),
        const SizedBox(width: 20),
        // Sonraki parça butonu
        NeumorphicButton(
          icon: Icons.skip_next,
          iconSize: 35,
          bgColor: const Color(0xFF2E2E2E),
          padding: const EdgeInsets.all(16),
          onPressed: () {},
        ),
      ],
    );
  }
}
