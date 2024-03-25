import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Colors.black;
  static Color red = Colors.red[600]!;

  static const Color white = Colors.white;
  static const Color dimBlack = Colors.black12;
  static const Color fadedBlack = Colors.black38;
  static const Color textColor = Color.fromARGB(255, 21, 20, 24);
  static const Color bigTextColor = Color.fromARGB(255, 10, 10, 14);
  static Color mainColor = const Color.fromARGB(255, 11, 151, 6);

  static const Color starColor = Color(0xFFe7bb4e);
  static Color mainTextColor = Colors.black.withOpacity(0.8);
  static const Color buttonBackground = Color(0xFFf1f1f9);
  static const Color backgroundColor = Color.fromRGBO(255, 255, 255, 1);
  static Color pink = Colors.pink[800]!;
  static Color bluetheme = const Color.fromARGB(255, 13, 110, 175);

  static Random random = Random();
  static Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }
}
