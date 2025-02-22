import 'package:flutter/material.dart';
import 'package:music_player/constants/circle_cover.dart';
import 'package:music_player/constants/gradient_bg.dart';
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
        decoration: const BoxDecoration(gradient: GradientBG.background),
        width: double.infinity, // Tüm ekranı kaplasın
        child: Center(
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
