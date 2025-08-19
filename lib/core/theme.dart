import 'package:artora/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTheme {
  static ThemeData get lightTheme {
    final baseLight = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: Appcolors.primary,
      scaffoldBackgroundColor: Appcolors.primary,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 36,
          color: Appcolors.lightText,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Appcolors.lightText,
        ),
        bodySmall: TextStyle(fontSize: 16, color: Colors.white60),
        titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Appcolors.lightText,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Appcolors.lightText,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Appcolors.lightText,
        ),
      ),
    );

    return baseLight;
  }
}