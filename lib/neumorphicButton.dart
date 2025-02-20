import 'package:flutter/material.dart';

class NeumorphicButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double iconSize;
  final Color bgColor;
  final EdgeInsets padding;

  const NeumorphicButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconSize = 30.0, // Varsayılan ikon boyutu
    this.bgColor = const Color(0xFF2E2E2E), // Varsayılan arka plan rengi
    this.padding = const EdgeInsets.all(15), // Daha iyi padding
  });

  @override
  _NeumorphicButtonState createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _isPressed = false;

  void _updateButtonState(bool pressed) {
    setState(() {
      _isPressed = pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _updateButtonState(true),
      onTapUp: (_) {
        _updateButtonState(false);
        widget.onPressed();
      },
      onTapCancel: () => _updateButtonState(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: _neumorphicDecoration(_isPressed),
        child: Padding(
          padding: widget.padding,
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: _isPressed ? Colors.grey.shade700 : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  BoxDecoration _neumorphicDecoration(bool isPressed) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: widget.bgColor,
      boxShadow:
          isPressed
              ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  offset: const Offset(3, 3),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  offset: const Offset(-3, -3),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ]
              : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: const Offset(6, 6),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.15),
                  offset: const Offset(-6, -6),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ],
    );
  }
}
