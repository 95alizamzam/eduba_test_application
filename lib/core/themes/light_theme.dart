import 'package:flutter/material.dart';

class LightTheme {
  ThemeData get getLightTheme => lightTheme;

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff121212),
  );
}
