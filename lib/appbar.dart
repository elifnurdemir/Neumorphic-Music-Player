import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF212121),
      title: const Text(
        'Playing Now',
        style: TextStyle(color: Color(0xFFBDBDBD)),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.info, color: Color(0xFFBDBDBD)),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Color(0xFFBDBDBD)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
