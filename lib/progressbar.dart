import 'package:flutter/material.dart';

class MusicProgressBar extends StatelessWidget {
  const MusicProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: LinearProgressIndicator(
        value: 0.3,
        backgroundColor: Colors.grey[300],
        valueColor: const AlwaysStoppedAnimation(Color(0xFF26A69A)),
        minHeight: 8,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
