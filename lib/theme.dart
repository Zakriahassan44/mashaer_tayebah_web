import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();
  static const ink = Color(0xFF211D18);
  static const cream = Color(0xFFFAF6EE);
  static const cream2 = Color(0xFFF2EAD9);
  static const gold = Color(0xFFC1893C);
  static const goldDark = Color(0xFFA06F2C);
  static const line = Color(0x1F211D18);
  static const muted = Color(0xFF6B6255);
  static const bodyText = Color(0xFF514A3F);
}

ThemeData buildAppTheme() {
  final base = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.cream,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.gold,
      surface: AppColors.cream,
    ),
  );
  return base.copyWith(
    textTheme: GoogleFonts.cairoTextTheme(base.textTheme).apply(
      bodyColor: AppColors.ink,
      displayColor: AppColors.ink,
    ),
  );
}

/// Breakpoints used across the page.
class Breakpoints {
  static const mobile = 700.0;
  static const tablet = 980.0;
}

const double maxContentWidth = 1120.0;
