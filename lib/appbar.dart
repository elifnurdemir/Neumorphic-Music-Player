import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Butonları ve başlığı eşit dağıt
        children: [
          _neumorphicButton(icon: Icons.info, onPressed: () {}), // Sol buton
          const Text(
            'Playing Now',
            style: TextStyle(color: Color(0xFFBDBDBD)),
          ), // Başlık ortada
          _neumorphicButton(icon: Icons.menu, onPressed: () {}), // Sağ buton
        ],
      ),
    );
  }

  Widget _neumorphicButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 50, // Butonun genişliği
      height: 40, // Butonun yüksekliği
      decoration: _neumorphicDecoration(),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: const Color.fromARGB(255, 111, 108, 108),
          size: 24, // İkonun boyutu
        ),
        padding: EdgeInsets.zero, // Varsayılan padding'i kaldır
        constraints:
            const BoxConstraints(), // Varsayılan minimum boyutu sıfırla
      ),
    );
  }

  BoxDecoration _neumorphicDecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: const Color(0xFF2E2E2E),
      border: Border.all(color: Colors.black45, width: 3),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.7),
          offset: const Offset(4, 4),
          blurRadius: 6,
        ),
        BoxShadow(
          color: Colors.white.withOpacity(0.1),
          offset: const Offset(-4, -4),
          blurRadius: 6,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50); // Yüksekliği artırdık
}
