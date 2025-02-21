import 'package:flutter/material.dart';
import 'package:music_player/constants/circle_cover.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Playlist',
          style: TextStyle(
            color: Color(0xFFBDBDBD),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
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
        child: Align(alignment: Alignment.topCenter, child: CircleCover()),
      ),
    );
  }
}
