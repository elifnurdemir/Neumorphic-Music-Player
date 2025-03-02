import 'package:flutter/material.dart';
import 'package:music_player/constants/neumorphic_button.dart';
import 'package:music_player/constants/title_textstyle.dart';
import 'package:music_player/pages/playlist_screen/playlist.dart';

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayList()),
                );
              },
            ),
            Text('Playing Now', style: TitleTextStyle.title),
            NeumorphicButton(icon: Icons.menu, onPressed: () {}),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(85); // AppBar yüksekliği
}
