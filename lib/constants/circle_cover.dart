// Neomorfik Albüm Çerçevesi
import 'package:flutter/material.dart';

class CircleCover extends StatelessWidget {
  const CircleCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF2E2E2E),
        border: Border.all(color: const Color(0xFF404040), width: 3),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.8),
            offset: const Offset(6, 6),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.1),
            offset: const Offset(-6, -6),
            blurRadius: 10,
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(5.0), // İçerideki albüm fotoğrafı için boşluk
        child: CircleAvatar(
          radius: 130,
          backgroundImage: AssetImage('assets/images/powerwolf.jpg'),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
