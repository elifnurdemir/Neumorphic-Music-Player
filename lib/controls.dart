import 'package:flutter/material.dart';
import 'package:music_player/button.dart';

class MusicControls extends StatelessWidget {
  const MusicControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ControlButton(
          icon: Icons.skip_previous,
          iconSize: 40,
          bgColor: const Color(0xFFEEEEEE),
        ),
        ControlButton(
          icon: Icons.play_arrow,
          iconSize: 50,
          bgColor: const Color(0xFF26A69A),
          isPrimary: true,
        ),
        ControlButton(
          icon: Icons.skip_next,
          iconSize: 40,
          bgColor: const Color(0xFFEEEEEE),
        ),
      ],
    );
  }
}
