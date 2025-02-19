import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Playing Now',
        style: TextStyle(color: Color(0xFFBDBDBD)),
      ),
      leading: _neumorphicButton(icon: Icons.info, onPressed: () {}),
      leadingWidth: 100,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: _neumorphicButton(icon: Icons.menu, onPressed: () {}),
        ),
      ],
    );
  }

  Widget _neumorphicButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: _neumorphicDecoration(),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: const Color(0xFFBDBDBD), size: 30),
      ),
    );
  }

  BoxDecoration _neumorphicDecoration() {
    return BoxDecoration(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
