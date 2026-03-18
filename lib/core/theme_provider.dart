import 'package:flutter/material.dart';

final themeProvider = ThemeProvider();

class ThemeProvider extends ChangeNotifier
{
  String _selectedColor = 'blue';

  String get selectedColor => _selectedColor;

  void updateTheme(String newColor)
  {
    _selectedColor = newColor;
    notifyListeners();
    
  }
}