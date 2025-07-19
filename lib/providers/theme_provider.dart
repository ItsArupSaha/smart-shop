import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final SharedPreferences prefs;
  static const String _themeKey = 'theme_mode';

  ThemeProvider(this.prefs) {
    _loadTheme();
  }

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? _darkTheme : _lightTheme;

  void _loadTheme() {
    _isDarkMode = prefs.getBool(_themeKey) ?? false;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    prefs.setBool(_themeKey, _isDarkMode);
    notifyListeners();
  }

  static final _lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final _darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      // Pure dark colors
      primary: Colors.white,
      onPrimary: Colors.black,
      primaryContainer: Colors.white,
      onPrimaryContainer: Colors.black,
      
      secondary: Colors.white,
      onSecondary: Colors.black,
      secondaryContainer: Colors.white,
      onSecondaryContainer: Colors.black,
      
      tertiary: Colors.white,
      onTertiary: Colors.black,
      tertiaryContainer: Colors.white,
      onTertiaryContainer: Colors.black,
      
      // Pure black background
      surface: Colors.black,
      onSurface: Colors.white,
      surfaceVariant: Colors.black,
      onSurfaceVariant: Colors.white,
      
      // Pure black background
      background: Colors.black,
      onBackground: Colors.white,
      
      // Error colors
      error: Colors.red,
      onError: Colors.white,
      errorContainer: Colors.red[900]!,
      onErrorContainer: Colors.white,
      
      // Outline colors
      outline: Colors.grey[800]!,
      outlineVariant: Colors.grey[700]!,
      
      // Shadow colors
      shadow: Colors.black,
      scrim: Colors.black,
      
      // Inverse colors
      inverseSurface: Colors.white,
      onInverseSurface: Colors.black,
      inversePrimary: Colors.grey[300]!,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.black,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[800]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[800]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.red),
      ),
      labelStyle: TextStyle(color: Colors.white),
      hintStyle: TextStyle(color: Colors.grey[600]!),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.white,
      selectedColor: Colors.white,
      disabledColor: Colors.grey[900]!,
      labelStyle: TextStyle(color: Colors.black),
      secondaryLabelStyle: TextStyle(color: Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[800]!,
      thickness: 1,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
} 