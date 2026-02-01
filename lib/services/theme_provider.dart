/// App Themes
/// Defines 4 kid-friendly themes: default, neon, dark, pastel
library;

import 'package:flutter/material.dart';

class AppThemes {
  // Default theme - bright and cheerful
  static ThemeData defaultTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      bodyMedium: TextStyle(
        color: Colors.black87,
        fontSize: 16,
      ),
    ),
  );

  // Neon theme - vibrant and energetic
  static ThemeData neonTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xFF0A0E27),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A1F3A),
      foregroundColor: Colors.cyan,
      elevation: 2,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.cyan,
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
  );

  // Dark theme - easy on the eyes
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
      foregroundColor: Colors.tealAccent,
      elevation: 2,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.tealAccent,
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      bodyMedium: TextStyle(
        color: Colors.white70,
        fontSize: 16,
      ),
    ),
  );

  // Pastel theme - soft and friendly
  static ThemeData pastelTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFF69B4),
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xFFFFF0F5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFB6D9),
      foregroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFDDA0DD),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Color(0xFFFF69B4),
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      bodyMedium: TextStyle(
        color: Colors.black54,
        fontSize: 16,
      ),
    ),
  );

  // Gold theme - luxurious and premium
  static ThemeData goldTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFFD700),
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xFFFFFBE6),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFC700),
      foregroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFD700),
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Color(0xFFCC8800),
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      bodyMedium: TextStyle(
        color: Colors.black87,
        fontSize: 16,
      ),
    ),
  );

  /// Get theme by name
  static ThemeData getTheme(String themeName) {
    switch (themeName.toLowerCase()) {
      case 'dark':
        return darkTheme;
      case 'pastel':
        return pastelTheme;
      case 'gold':
        return goldTheme;
      default:
        return defaultTheme;
    }
  }

  /// Get list of available themes
  static List<String> getAvailableThemes() {
    return ['default', 'dark', 'pastel', 'gold'];
  }
}

/// Theme Provider - manages theme state globally
class ThemeProvider extends ChangeNotifier {
  String _currentTheme = 'default';

  String get currentTheme => _currentTheme;
  ThemeData get themeData => AppThemes.getTheme(_currentTheme);

  /// Set theme
  void setTheme(String themeName) {
    if (AppThemes.getAvailableThemes().contains(themeName)) {
      _currentTheme = themeName;
      notifyListeners();
    }
  }

  /// Initialize theme from saved data
  void initializeTheme(String savedTheme) {
    _currentTheme = savedTheme;
    notifyListeners();
  }
}
