import 'package:flutter/material.dart';

class AppThemes {
  static final light = ThemeData(
    primaryColor: Color(0xffb31c23),
    scaffoldBackgroundColor: Color(0xffEBE8DB),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xffEBE8DB),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xffb31c23),
      primary: Color(0xffb31c23),
      brightness: Brightness.light,
      surface: Color(0xffEBE8DB),
    ),
    cardColor: Color(0xffEBE8DB),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xffEBE8DB),
      selectedItemColor: Color(0xffD76C82),
      unselectedItemColor: Colors.grey,
    ),
  );

  //dark theme
  static final dark = ThemeData(
    primaryColor: Color(0xffb31c23),
    scaffoldBackgroundColor: Color(0xFF121212),
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF121212),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xffb31c23),
      primary: Color(0xffb31c23),
      brightness: Brightness.dark,
      surface: Color(0xFF121212),
    ),
    cardColor: Color(0xFF1E1E1E),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xffD76C82),
      unselectedItemColor: Colors.grey,
    ),
  );
}
