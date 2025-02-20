import 'package:flutter/material.dart';
import 'package:music_player/constants/neumorphicButton.dart';

class AlbumCover extends StatelessWidget {
  const AlbumCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Neomorfik Albüm Çerçevesi
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF2E2E2E),
            border: Border.all(color: const Color(0xFF404040), width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                offset: const Offset(6, 6),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                offset: const Offset(-6, -6),
                blurRadius: 10,
              ),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.all(
              5.0,
            ), // İçerideki albüm fotoğrafı için boşluk
            child: CircleAvatar(
              radius: 130,
              backgroundImage: AssetImage('assets/images/powerwolf.jpg'),
              backgroundColor: Colors.grey,
            ),
          ),
        ),

        // Butonları konumlandırma (Sol & Sağ)
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
