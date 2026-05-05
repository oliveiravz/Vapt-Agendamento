import 'package:flutter/material.dart';
import 'package:vapt_agendamento/core/app_colors.dart'; 

class ThemeProvider extends ChangeNotifier {
  String _selectedColor = 'blue';

  ThemeMode _themeMode = ThemeMode.system; 

  String get selectedColor => _selectedColor;
  ThemeMode get themeMode => _themeMode;

  Color get currentColor {
    final theme = AppColors.themes.firstWhere(
      (t) => t['id'] == _selectedColor,
      orElse: () => AppColors.themes.first,
    );
    return theme['color'] as Color;
  }

  void updateThemeMode(ThemeMode newMode) {
    if (_themeMode != newMode) {
      _themeMode = newMode;
      notifyListeners();
    }
  }

  void updateTheme(String newColor) {
    if (_selectedColor != newColor) {
      _selectedColor = newColor;
      notifyListeners();
    }
  }
}