import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApp {
  Color textcolor1 = Color(0xFFA0A0A3);
  static const _lightfillColor = Color(0xFF8B15FF);

  static ThemeData themeData() {
    return ThemeData(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      accentColor: colorScheme.primary.withOpacity(0.2),
      canvasColor: colorScheme.background,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: Colors.white,
      textTheme: _textTheme,
      appBarTheme: AppBarTheme(
          elevation: 1,
          textTheme: _textTheme,
          iconTheme: IconThemeData(color: _lightfillColor)),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightfillColor.withOpacity(0.80),
          Colors.white,
        ),
        contentTextStyle: _textTheme.subtitle1.apply(color: Colors.white),
      ),
    );
  }

  static ColorScheme colorScheme = new ColorScheme(
    primary: Color(0xFF8B15FF),
    primaryVariant: Colors.blue,
    background: const Color(0xFFE6EBEB),
    secondary: const Color(0xFFEFF3F3),
    secondaryVariant: const Color(0xFFFAFBFB),
    brightness: Brightness.light,
    surface: const Color(0xFFE6EBEB),
    onBackground: Colors.white,
    error: _lightfillColor,
    onError: _lightfillColor,
    onPrimary: _lightfillColor,
    onSecondary: _lightfillColor,
    onSurface: _lightfillColor,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w800;

  static TextTheme _textTheme = TextTheme(
    headline1: GoogleFonts.quicksand(fontWeight: _bold, fontSize: 70),
    headline2: GoogleFonts.quicksand(fontWeight: _bold, fontSize: 60),
    headline3: GoogleFonts.quicksand(fontWeight: _bold, fontSize: 40),
    headline4: GoogleFonts.quicksand(fontWeight: _medium, fontSize: 20),
    headline5: GoogleFonts.quicksand(fontWeight: _medium, fontSize: 16),
    headline6: GoogleFonts.quicksand(fontWeight: _bold, fontSize: 16),
    caption: GoogleFonts.quicksand(fontWeight: _medium, fontSize: 16),
    button: GoogleFonts.quicksand(fontWeight: _semiBold),
    bodyText1: GoogleFonts.quicksand(fontWeight: _regular, fontSize: 15),
    bodyText2: GoogleFonts.quicksand(fontWeight: _regular, fontSize: 16),
    overline: GoogleFonts.quicksand(fontWeight: _medium, fontSize: 12),
    subtitle2: GoogleFonts.quicksand(fontWeight: _medium, fontSize: 14.0),
    subtitle1: GoogleFonts.quicksand(fontWeight: _medium, fontSize: 16.0),
  );
}

const kDeffaultColor = Color(0xFF8B15FF);
const kDeffaultpadding = 20.0;
const kDeffaulttextcolor = Color(0xFF343435);
final kDeffaultTextTitle =
    GoogleFonts.baloo(fontWeight: FontWeight.w900, fontSize: 40);
