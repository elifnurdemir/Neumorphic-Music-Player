import 'package:flutter/material.dart';
import 'package:music_player/constants/circle_cover.dart';
import 'package:music_player/constants/gradient_bg.dart';
import 'package:music_player/constants/neumorphic_button.dart';
import 'package:music_player/constants/title_textstyle.dart';
import 'package:music_player/pages/playlist_screen/list.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // **AppBar'ı şeffaf yap**
      appBar: AppBar(
        title: Text('Playlist', style: TitleTextStyle.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: GradientBG.background),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + kToolbarHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NeumorphicButton(icon: Icons.playlist_add, onPressed: () {}),
                const SizedBox(width: 20),
                SizedBox(width: 160, height: 160, child: CircleCover()),
                const SizedBox(width: 20),
                NeumorphicButton(icon: Icons.share, onPressed: () {}),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: Playlist.getItems(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
