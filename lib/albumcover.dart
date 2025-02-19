import 'package:flutter/material.dart';

class AlbumCover extends StatelessWidget {
  const AlbumCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF2E2E2E),
            border: Border.all(color: Colors.black45, width: 5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                offset: const Offset(7, 7),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                offset: const Offset(-7, -7),
                blurRadius: 10,
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: 130,
            backgroundImage: AssetImage('assets/images/powerwolf.jpg'),
            backgroundColor: Colors.grey,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                size: 40,
                color: Color(0xFFBDBDBD),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.repeat,
                size: 40,
                color: Color(0xFFBDBDBD),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
