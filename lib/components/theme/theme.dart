import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData lightMode = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey[300],
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFF2b2d42),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      selectedItemColor: Colors.blue,
    ),
    primaryColor: Colors.white,
  );

  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF343a40),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFF141922),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xFF141922)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      selectedItemColor: Colors.blue,
    ),
    primaryColorDark: const Color(0xFF141922),
  );
}
