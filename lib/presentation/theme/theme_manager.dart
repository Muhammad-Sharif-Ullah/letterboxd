import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData letterboxdTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFFB484B3),
    backgroundColor: const Color(0xFFB484B3),
    scaffoldBackgroundColor: const Color(0xFF1E1D37),
    canvasColor: const Color(0xFF1E1D37),
    drawerTheme: DrawerThemeData(
      scrimColor: const Color(0xFFB484B3).withOpacity(0.1),
      elevation: 4,
      backgroundColor: const Color(0xFF1E1D37),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1D37),
      elevation: 0,
    ),
  );
  ThemeManager._();
}
