import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFDFECDB),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.blue,
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

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF060E1E),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xFF5D9CEC),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xFF141922)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    selectedItemColor: Colors.blue,
  ),
  primaryColorDark: const Color(0xFF141922),
);
