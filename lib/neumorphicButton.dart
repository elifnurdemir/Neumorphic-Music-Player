import 'package:flutter/material.dart';

// Sabitler (Temel renkler ve boyutlar)
const Color _kDarkBgColor = Color(0xFF2E2E2E);
const Color _kBorderColor = Color(0xFF404040);
const double _kIconSize = 30.0;
const EdgeInsets _kPadding = EdgeInsets.all(15);
const double _kBorderWidth = 2.0;

class NeumorphicButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double iconSize;
  final Color bgColor;
  final EdgeInsets padding;
  final Color borderColor;

  const NeumorphicButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconSize = _kIconSize,
    this.bgColor = _kDarkBgColor,
    this.padding = _kPadding,
    this.borderColor = _kBorderColor,
  });

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _isPressed = false;

  // Gölgeleri Dinamik Olarak Oluştur
  List<BoxShadow> _getShadows(bool isPressed) {
    return isPressed
        ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            offset: const Offset(3, 3),
            blurRadius: 6,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            offset: const Offset(-3, -3),
            blurRadius: 6,
          ),
        ]
        : [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(6, 6),
            blurRadius: 12,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            offset: const Offset(-6, -6),
            blurRadius: 12,
          ),
        ];
  }

  // Gradient'i Dinamik Olarak Oluştur
  Gradient _getGradient(bool isPressed) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors:
          isPressed
              ? [Colors.grey.shade800, Colors.grey.shade700]
              : [Colors.grey.shade900, Colors.grey.shade800],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.bgColor,
          border: Border.all(color: widget.borderColor, width: _kBorderWidth),
          gradient: _getGradient(_isPressed),
          boxShadow: _getShadows(_isPressed),
        ),
        child: Padding(
          padding: widget.padding,
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: _isPressed ? Colors.grey.shade400 : Colors.grey.shade200,
          ),
        ),
      ),
    );
  }
}
