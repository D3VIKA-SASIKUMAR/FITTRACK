import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ValueNotifier<ThemeMode> {
  static const String _themeKey = 'theme_mode';

  ThemeNotifier(super.initialMode);

  /// Toggles between light and dark mode, and saves the selection
  Future<void> toggleTheme() async {
    value = value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await _saveToPrefs();
  }

  /// Saves the current theme to SharedPreferences
  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, value == ThemeMode.dark);
  }

  /// Loads the theme from SharedPreferences (if you want to use it statically)
  static Future<ThemeMode> getSavedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_themeKey) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
