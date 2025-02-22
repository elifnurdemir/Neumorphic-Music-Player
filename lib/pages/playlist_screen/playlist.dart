import 'package:flutter/material.dart';
import 'package:music_player/constants/circle_cover.dart';
import 'package:music_player/constants/neumorphic_button.dart';
import 'package:music_player/constants/title_textstyle.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Playlist', style: TitleTextStyle.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity, // Tüm ekranı kaplasın
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 105, 108, 124),
              Color.fromARGB(255, 42, 43, 49),
              Color.fromARGB(255, 16, 17, 21),
            ],
          ),
        ),
        child: Center(
          // Ana içeriği ortala
          child: Column(
            mainAxisSize: MainAxisSize.min, // İçeriği sıkıştır
            children: [
              Row(
                mainAxisSize: MainAxisSize.min, // İçeriği sıkıştır
                // Ortala
                crossAxisAlignment: CrossAxisAlignment.center, // Dikey hizalama
                children: [
                  NeumorphicButton(
                    icon: Icons.playlist_add,
                    onPressed: () {},
                  ), // Sol ikon
                  const SizedBox(width: 20), // Boşluk ekleyerek ayır
                  SizedBox(
                    width: 160, // CircleCover boyutunu küçült
                    height: 160,
                    child: CircleCover(),
                  ), // Ortada duracak albüm kapağı
                  const SizedBox(width: 20), // Boşluk ekleyerek ayır
                  NeumorphicButton(
                    icon: Icons.share,
                    onPressed: () {},
                  ), // Sağ ikon
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
