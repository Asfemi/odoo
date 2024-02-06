import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoo/constants/constants.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static final ColorScheme _appColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.white,
    brightness: Brightness.dark,
    primary: Colors.white,
    onPrimary: Colors.white,
    background: Colors.transparent,
    onBackground: Colors.white,
  );

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: _appColorScheme.copyWith(brightness: Brightness.light),
        fontFamily: 'inter',
        appBarTheme: AppBarTheme(
          backgroundColor: _appColorScheme.primary,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          colorScheme: _appColorScheme,
        ),

        textTheme: TextTheme(
          displayMedium: GoogleFonts.inter(
            fontSize: 40,
            color: kLightTextColor,
          ),
          displaySmall: GoogleFonts.inter(
            color: kLightTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: GoogleFonts.inter(
            color: kLightTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: GoogleFonts.inter(
            color: kLightTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          bodyMedium: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          titleMedium: GoogleFonts.inter(
            color: kLightTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          titleSmall: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        cardColor: Colors.transparent,
        scaffoldBackgroundColor: _appColorScheme.background,
        colorScheme: _appColorScheme,
        fontFamily: 'Montserrat',
        dividerColor: Colors.white54,
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

/// whiteSpace
const gapH30 = SizedBox(
  height: 30,
);
const gapH15 = SizedBox(
  height: 15,
);
const gapW15 = SizedBox(
  width: 15,
);
const gapH10 = SizedBox(
  height: 10,
);
const gapW10 = SizedBox(
  width: 10,
);

extension TextStyleHelpers on TextStyle {
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get boldest => copyWith(fontWeight: FontWeight.w900);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get sizePlus => copyWith(fontSize: fontSize! + 1);
  TextStyle withSize(double fontsize) => copyWith(fontSize: fontsize);
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle get sizeMinus => copyWith(fontSize: fontSize! - 1);
  TextStyle letterSpacing(double value) => copyWith(letterSpacing: value);
}

