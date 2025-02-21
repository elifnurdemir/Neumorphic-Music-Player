import 'package:flutter/material.dart';
import 'package:music_player/constants/circle_cover.dart';
import 'package:music_player/constants/neumorphic_button.dart';

class AlbumCover extends StatelessWidget {
  const AlbumCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleCover(),
        SizedBox(
          width: 340, // Albüm kapağının dışına taşmadan genişlik ayarla
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NeumorphicButton(
                onPressed: () {},
                icon: Icons.favorite_border,
                iconSize: 25,
                bgColor: const Color(0xFF2E2E2E),
                padding: const EdgeInsets.all(12),
                borderColor: const Color(0xFF404040),
              ),
              NeumorphicButton(
                onPressed: () {},
                icon: Icons.repeat,
                iconSize: 25,
                bgColor: const Color(0xFF2E2E2E),
                padding: const EdgeInsets.all(12),
                borderColor: const Color(0xFF404040),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
