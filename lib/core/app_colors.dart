import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // --- Theme blue ---
  static const primaryBlue = Color(0xFF2678B7);
  // static const secondaryBlue = Color(0xFFF0F0F0);

  // --- theme purple ---
  static const primaryPurple = Color.fromARGB(255, 145, 74, 244);

  // --- theme pink ---
  static const primaryPink = Color(0xFFE91E63);
  static const secondaryPink = Color(0xFFF48FB1);

  static const primaryWhite = Color(0xFFFFFFFF);
  static const primaryBlack = Color(0xFF000000);

  static const primaryOrange = Color(0xFFFF9800);

  static List<Map<String, dynamic>> themes = [
    {'id': 'blue', 'name': 'Azul', 'color': AppColors.primaryBlue},
    {'id': 'purple', 'name': 'Roxo', 'color': AppColors.primaryPurple},
    {'id': 'pink', 'name': 'Rosa', 'color': AppColors.primaryPink},
    {'id': 'white', 'name': 'Branco', 'color': AppColors.primaryWhite},
    {'id': 'black', 'name': 'Preto', 'color': AppColors.primaryBlack},
    {'id': 'orange', 'name': 'Laranja', 'color': AppColors.primaryOrange}
  ];

  // generate color scheme based on selected color
  static ColorScheme getColorScheme(bool isDarkMode, String themeColor) {

    if (themeColor == 'pink') {
      return ColorScheme.fromSeed(
        seedColor: primaryPink,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primary: primaryPink, // force the exact color
      );
    }

    if(themeColor == 'purple') {
      return ColorScheme.fromSeed(
        seedColor: primaryPurple,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primary: primaryPurple, // force the exact color
      );
    }

    // Default (Blue)
    return ColorScheme.fromSeed(
      seedColor: primaryBlue,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      primary: primaryBlue, // force the exact color
    );
  }
}
