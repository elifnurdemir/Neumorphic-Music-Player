import 'package:flutter/material.dart';

class GradientBG {
  static const LinearGradient background = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(255, 105, 108, 124),
      Color.fromARGB(255, 42, 43, 49),
      Color.fromARGB(255, 16, 17, 21),
    ],
  );
}
