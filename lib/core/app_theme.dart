import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData createTheme(bool isDarkMode, String selectedColor) {
    // Uses color scheme created in app_colors
    final colorScheme = AppColors.getColorScheme(isDarkMode, selectedColor);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      // Function that defines the fonts
      textTheme: _buildTextTheme(isDarkMode ? ThemeData.dark().textTheme : ThemeData.light().textTheme),
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {    
    return base.copyWith(
    // Adding a ? before each .copyWith( call ensures that if the property is null, it simply doesn't try to copy it
    // App_name_large (Figma) -> displayLarge
    displayLarge: base.displayLarge?.copyWith(
      fontFamily: 'Pacifico',
      fontSize: 64.0,
      height: 1.2, // "Auto" on Figma is usually ~1.2 a 1.4
    ),

    // App_name_normal (Figma) -> displayMedium
    displayMedium: base.displayMedium?.copyWith(
      fontFamily: 'Pacifico',
      fontSize: 40.0,
    ),

    // Body_bold_large (Figma) -> titleLarge
    titleLarge: base.titleLarge?.copyWith(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      fontSize: 24.0,
    ),

    // Body_bold_medium (Figma) -> bodyLarge
    bodyLarge: base.bodyLarge?.copyWith(
      fontFamily: 'Inter',
      // fontWeight: FontWeight.w700,
      fontSize: 20.0,
    ),

    // Body_bold_small (Figma) -> bodyMedium
    bodyMedium: base.bodyMedium?.copyWith(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      fontSize: 16.0,
    ),

    // Body_black_italic_small (Figma) -> mapeado para labelSmall
    labelSmall: base.labelSmall?.copyWith(
      fontFamily: 'Inter',
      // fontWeight: FontWeight.w900, // Black
      fontStyle: FontStyle.italic,
      fontSize: 16.0,
    ),
  );
  }
}