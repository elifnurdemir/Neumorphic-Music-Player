import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color bgColor;
  final bool isPrimary;

  const ControlButton({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.bgColor,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
      child: Icon(
        icon,
        size: iconSize,
        color:
            isPrimary ? Colors.white : const Color.fromARGB(137, 210, 202, 202),
      ),
    );
  }
}
