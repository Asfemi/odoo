import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static final ColorScheme _appColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.orange,
    brightness: Brightness.dark,
    primary: Colors.orange,
    onPrimary: Colors.white,
    background: Colors.transparent,
    onBackground: Colors.white,
  );

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,

        scaffoldBackgroundColor: Colors.white, // Adjust for light theme
        colorScheme: _appColorScheme.copyWith(brightness: Brightness.light),
        fontFamily: 'Montserrat',
        appBarTheme: AppBarTheme(
          backgroundColor: _appColorScheme.primary,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          colorScheme: _appColorScheme,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        cardColor: Colors.transparent,
        scaffoldBackgroundColor: _appColorScheme.background,
        colorScheme: _appColorScheme,
        fontFamily: 'Montserrat',
        appBarTheme: AppBarTheme(
          backgroundColor: _appColorScheme.primary,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          colorScheme: _appColorScheme,
        ),
      );
}
