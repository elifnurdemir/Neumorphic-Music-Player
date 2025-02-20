import 'package:flutter/material.dart';
import 'package:music_player/neumorphicButton.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 100, // Yükseklik artırıldı
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
        ), // Kenar boşlukları
        decoration: BoxDecoration(
          color: Colors.transparent, // Arka planı şeffaf bırak
          borderRadius: BorderRadius.circular(20), // Hafif oval köşeler
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NeumorphicButton(
              icon: Icons.arrow_back,
              onPressed: () {},
              iconSize: 20,
              bgColor: const Color(0xFF2E2E2E),
              padding: const EdgeInsets.all(14),
            ),
            const Text(
              'Playing Now',
              style: TextStyle(
                color: Color(0xFFBDBDBD),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            NeumorphicButton(
              icon: Icons.menu,
              onPressed: () {},
              iconSize: 20,
              bgColor: const Color(0xFF2E2E2E),
              padding: const EdgeInsets.all(14),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(85); // AppBar yüksekliği
}
