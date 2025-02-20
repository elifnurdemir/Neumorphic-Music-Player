import 'package:flutter/material.dart';

@override
LinearGradient build(BuildContext context) {
  return LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(255, 105, 108, 124), // AppBar ile aynı renk
      Color.fromARGB(255, 42, 43, 49),
      Color.fromARGB(255, 16, 17, 21),
    ],
  );
}
