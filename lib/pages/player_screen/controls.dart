import 'package:flutter/material.dart';
import 'package:music_player/constants/neumorphic_button.dart';

class MusicControls extends StatelessWidget {
  const MusicControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Daha dengeli hizalama
      children: [
        // Önceki parça butonu
        NeumorphicButton(
          icon: Icons.skip_previous,
          iconSize: 35,
          bgColor: const Color(0xFF2E2E2E),
          padding: const EdgeInsets.all(16), // Daha iyi tıklanabilirlik
          onPressed: () {},
        ),
        const SizedBox(width: 20), // Butonlar arasına boşluk ekledik
        // Oynatma / duraklatma butonu (Ana buton)
        NeumorphicButton(
          icon: Icons.play_arrow,
          iconSize: 50,
          bgColor: const Color(0xFF26A69A), // Ana buton için farklı renk
          padding: const EdgeInsets.all(
            20,
          ), // Büyük buton için padding artırıldı
          onPressed: () {},
        ),
        const SizedBox(width: 20), // Butonlar arasına boşluk ekledik
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
