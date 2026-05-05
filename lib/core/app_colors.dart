import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primaryBlue = Color(0xFF2678B7);
  static const primaryPurple = Color.fromARGB(255, 145, 74, 244);
  static const primaryPink = Color(0xFFE91E63);
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

  static ColorScheme getColorScheme(bool isDarkMode, Color themeColor) {
    return ColorScheme.fromSeed(
      seedColor: themeColor,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      
      primary: themeColor, 
      
      onPrimary: _getContrastColor(themeColor), 
    );
  }

  static Color _getContrastColor(Color color) {
    return ThemeData.estimateBrightnessForColor(color) == Brightness.light 
        ? Colors.black 
        : Colors.white;
  }
}