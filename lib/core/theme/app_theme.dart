import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/color_constants.dart';

/// 🌟 Application Theme (Material 3 + Google Fonts)
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: ColorConstants.background,

      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: ColorConstants.primaryBlue,
        onPrimary: Colors.white,
        secondary: ColorConstants.primaryOrange,
        onSecondary: Colors.white,
        error: ColorConstants.error,
        onError: Colors.white,
        surface: ColorConstants.cardBackground,
        onSurface: ColorConstants.textPrimary,
      ),

      // 🔹 Global Text Theme (default styles)
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          color: ColorConstants.textPrimary,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.3,
          color: ColorConstants.textPrimary,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: ColorConstants.textPrimary,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: ColorConstants.textPrimary,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: ColorConstants.textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: ColorConstants.textSecondary,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.4,
          color: ColorConstants.textSecondary,
        ),
      ),

      // 🔹 Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.primaryBlue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // 🔹 Cards
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: ColorConstants.border,
            width: 1,
          ),
        ),
      ),
    );
  }
}