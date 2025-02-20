import 'package:flutter/material.dart';
import 'package:music_player/neumorphicButton.dart';

class AlbumCover extends StatelessWidget {
  const AlbumCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Albüm kapağı için dairesel arka plan
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF2E2E2E),
            border: Border.all(color: Colors.black45, width: 5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                offset: const Offset(7, 7),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                offset: const Offset(-7, -7),
                blurRadius: 10,
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: 130,
            backgroundImage: AssetImage('assets/images/powerwolf.jpg'),
            backgroundColor: Colors.grey,
          ),
        ),

        // Butonları konumlandırma (Sol ve Sağ)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NeumorphicButton(
              onPressed: () {},
              icon: Icons.favorite_border,
              iconSize: 32,
              bgColor: const Color(0xFF2E2E2E),
              padding: const EdgeInsets.all(12),
            ),

            NeumorphicButton(
              onPressed: () {},
              icon: Icons.repeat,
              iconSize: 32,
              bgColor: const Color(0xFF2E2E2E),
              padding: const EdgeInsets.all(12),
            ),
          ],
        ),
      ],
    );
  }
}
