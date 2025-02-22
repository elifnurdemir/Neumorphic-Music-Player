import 'package:flutter/material.dart';
import 'package:music_player/constants/title_textstyle.dart';

class SongDetails extends StatelessWidget {
  const SongDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Playing Now', style: TitleTextStyle.title),
        SizedBox(height: 8),
        Text('Playing Now', style: TitleTextStyle.title),
      ],
    );
  }
}
