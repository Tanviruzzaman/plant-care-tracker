import 'package:flutter/material.dart';

/// Fully custom light and dark themes. No `ThemeData()` default is used —
/// every color is defined here, and every widget in the app reads its colors
/// from `Theme.of(context)` (never a hardcoded Color).
class AppThemes {
  AppThemes._();

  // ---- Light theme palette ----
  static const Color _lightPrimary = Color(0xFF2E7D32); // leaf green
  static const Color _lightSecondary = Color(0xFF66BB6A);
  static const Color _lightBackground = Color(0xFFF1F8F2);
  static const Color _lightSurface = Color(0xFFFFFFFF);
  static const Color _lightOnSurface = Color(0xFF1B2E1D);
  static const Color _lightError = Color(0xFFC62828);

  // ---- Dark theme palette ----
  static const Color _darkPrimary = Color(0xFF81C784);
  static const Color _darkSecondary = Color(0xFF4CAF50);
  static const Color _darkBackground = Color(0xFF10160F);
  static const Color _darkSurface = Color(0xFF1C241A);
  static const Color _darkOnSurface = Color(0xFFE4EFE1);
  static const Color _darkError = Color(0xFFEF9A9A);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: _lightBackground,
    colorScheme: const ColorScheme.light(
      primary: _lightPrimary,
      onPrimary: Colors.white,
      secondary: _lightSecondary,
      onSecondary: Colors.white,
      surface: _lightSurface,
      onSurface: _lightOnSurface,
      error: _lightError,
      onError: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _lightPrimary,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: _lightSurface,
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _lightPrimary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _lightPrimary,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: _lightSurface,
      selectedItemColor: _lightPrimary,
      unselectedItemColor: Color(0xFF9AA79B),
      type: BottomNavigationBarType.fixed,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: _darkPrimary,
      onPrimary: Color(0xFF0A1509),
      secondary: _darkSecondary,
      onSecondary: Color(0xFF06210A),
      surface: _darkSurface,
      onSurface: _darkOnSurface,
      error: _darkError,
      onError: Color(0xFF2A0A0A),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _darkSurface,
      foregroundColor: _darkOnSurface,
      elevation: 0,
      centerTitle: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: _darkSurface,
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _darkPrimary,
        foregroundColor: const Color(0xFF0A1509),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _darkPrimary,
      foregroundColor: Color(0xFF0A1509),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: _darkSurface,
      selectedItemColor: _darkPrimary,
      unselectedItemColor: Color(0xFF6E7C6B),
      type: BottomNavigationBarType.fixed,
    ),
  );
}
