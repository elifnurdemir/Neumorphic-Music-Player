import 'package:flutter/material.dart';

class SongDetails extends StatelessWidget {
  const SongDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Şarkı Adı',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFBDBDBD),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Şarkıcı Adı',
          style: TextStyle(fontSize: 18, color: Color(0xFFBDBDBD)),
        ),
      ],
    );
  }
}
