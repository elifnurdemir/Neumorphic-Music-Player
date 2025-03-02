import 'package:flutter/material.dart';

class GradientBG {
  static const LinearGradient background = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(255, 140, 142, 152),
      Color.fromARGB(255, 41, 41, 42),
      Color.fromARGB(255, 0, 0, 0),
    ],
  );
}
