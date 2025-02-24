import 'package:flutter/material.dart';
import 'package:music_player/constants/neumorphic_button.dart';

class Playlist {
  static List<Widget> getItems() {
    return List.generate(7, (index) {
      return _buildListTile(
        songTitle: 'Sarki Adi',
        artistName: 'Sarkici Adi',
        playIcon: Icons.play_arrow_sharp,
        favoriteIcon: Icons.favorite_rounded,
      );
    });
  }

  // ListTile widget'ını parametrelerle yeniden kullanılabilir hale getirmek
  static Widget _buildListTile({
    required String songTitle,
    required String artistName,
    required IconData playIcon,
    required IconData favoriteIcon,
  }) {
    return ListTile(
      title: Text(songTitle, style: TextStyle(color: Colors.white)),
      subtitle: Text(
        artistName,
        style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          NeumorphicButton(icon: playIcon, onPressed: () {}),
          const SizedBox(width: 10),
          NeumorphicButton(icon: favoriteIcon, onPressed: () {}),
        ],
      ),
    );
  }
}
