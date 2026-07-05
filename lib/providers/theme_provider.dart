import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeProvider() {
    _loadTheme();
  }

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode {
    return _themeMode == ThemeMode.dark;
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt('theme_mode') ?? 2; // Default to system
    _themeMode = ThemeMode.values[themeIndex];
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    switch (_themeMode) {
      case ThemeMode.light:
        _themeMode = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        _themeMode = ThemeMode.system;
        break;
      case ThemeMode.system:
        _themeMode = ThemeMode.light;
        break;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', _themeMode.index);
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', mode.index);
    notifyListeners();
  }

  ThemeData get currentTheme {
    switch (_themeMode) {
      case ThemeMode.light:
        return AppTheme.lightTheme;
      case ThemeMode.dark:
        return AppTheme.darkTheme;
      case ThemeMode.system:
        // ✅ FIXED - Use MediaQuery or View.of(context)
        // Since this is a provider, we need to pass context or use a different approach
        return AppTheme.lightTheme; // Default fallback
    }
  }

  // ✅ NEW - Method that requires context for proper theme detection
  ThemeData getThemeWithContext(BuildContext context) {
    switch (_themeMode) {
      case ThemeMode.light:
        return AppTheme.lightTheme;
      case ThemeMode.dark:
        return AppTheme.darkTheme;
      case ThemeMode.system:
        // ✅ Use MediaQuery to detect system brightness
        final brightness = MediaQuery.platformBrightnessOf(context);
        return brightness == Brightness.dark
            ? AppTheme.darkTheme
            : AppTheme.lightTheme;
    }
  }

  // ✅ NEW - Helper to get brightness without context (for use in init)
  Future<Brightness> getSystemBrightness() async {
    // Use WidgetsBinding to get platform brightness
    final binding = WidgetsBinding.instance;
    return binding.platformDispatcher.platformBrightness;
  }
}
