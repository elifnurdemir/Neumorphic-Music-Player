import 'package:flutter/material.dart';
import 'package:music_player/constants/circle_cover.dart';
import 'package:music_player/constants/gradient_bg.dart';
import 'package:music_player/constants/neumorphic_button.dart';
import 'package:music_player/constants/title_textstyle.dart';
import 'package:music_player/pages/player_screen/song.dart';
import 'package:music_player/data/song_data.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Song> songs = PlaylistData.songs; // Merkezi şarkı listesi

    return Scaffold(
      extendBodyBehindAppBar: true,
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
                const SizedBox(width: 160, height: 160, child: CircleCover()),
                const SizedBox(width: 20),
                NeumorphicButton(icon: Icons.share, onPressed: () {}),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];

                  return ListTile(
                    title: Text(
                      song.title,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    subtitle: Text(
                      song.artist,
                      style: TextStyle(fontSize: 15, color: Colors.white70),
                    ),
                    onTap: () {
                      // Buraya şarkı çalma kodu eklenebilir
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        NeumorphicButton(
                          icon: Icons.play_arrow,
                          onPressed: () {},

                          // Şarkıyı çalma işlemi yapılacak
                        ),
                        NeumorphicButton(
                          icon: Icons.favorite_border,
                          onPressed: () {
                            // Favori tuşuna tıklama işlevi burada olacak
                            // Şarkıyı favorilere ekleme işlemi yapılacak
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
