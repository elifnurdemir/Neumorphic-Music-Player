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
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(
          color: isPrimary ? Colors.white : const Color(0xFFBDBDBD),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(isPrimary ? 50 : 30),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          size: iconSize,
          color: isPrimary ? Colors.white : const Color(0xFFBDBDBD),
        ),
      ),
    );
  }
}
