import 'package:flutter/material.dart';

// Sabitler
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

  List<BoxShadow> get _shadows => [
    BoxShadow(
      color:
          _isPressed
              ? const Color.fromRGBO(0, 0, 0, 0.8)
              : const Color.fromRGBO(0, 0, 0, 0.1),
      offset: Offset(_isPressed ? 3 : 6, _isPressed ? 3 : 6),
      blurRadius: _isPressed ? 6 : 12,
    ),
    BoxShadow(
      color: const Color.fromRGBO(255, 255, 255, 0.1),
      offset: Offset(_isPressed ? -3 : -6, _isPressed ? -3 : -6),
      blurRadius: _isPressed ? 6 : 12,
    ),
  ];

  Gradient get _gradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors:
        _isPressed
            ? [Colors.grey.shade900, Colors.grey.shade700]
            : [Colors.grey.shade700, Colors.grey.shade900],
  );

  @override
  Widget build(BuildContext context) {
    // MediaQuery ile ekranın boyutlarını alıyoruz
    final screenWidth = MediaQuery.of(context).size.width;

    // İkon boyutunu ekran genişliğine göre dinamik hale getiriyoruz
    double iconSize = screenWidth * 0.08; // Ekran genişliğinin %8'i kadar
    double paddingSize = screenWidth * 0.04; // Ekran genişliğinin %4'ü kadar

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
          gradient: _gradient,
          boxShadow: _shadows,
        ),
        child: Padding(
          padding: EdgeInsets.all(paddingSize), // Dinamik padding
          child: Icon(
            widget.icon,
            size: iconSize, // Dinamik icon boyutu
            color:
                _isPressed
                    ? const Color.fromRGBO(180, 180, 180, 1)
                    : const Color.fromRGBO(200, 200, 200, 1),
          ),
        ),
      ),
    );
  }
}
