import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Color tokens lifted from the "Executive Precision" design system
/// (UICT Online Attendance — Stitch export, DESIGN.md).
class AppColors {
  AppColors._();

  // Core surfaces
  static const Color surface = Color(0xFFFAF8FF);
  static const Color surfaceDim = Color(0xFFD2D9F4);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF2F3FF);
  static const Color surfaceContainer = Color(0xFFEAEDFF);
  static const Color surfaceContainerHigh = Color(0xFFE2E7FF);
  static const Color surfaceContainerHighest = Color(0xFFDAE2FD);

  // Text
  static const Color onSurface = Color(0xFF131B2E);
  static const Color onSurfaceVariant = Color(0xFF464555);
  static const Color outline = Color(0xFF777587);
  static const Color outlineVariant = Color(0xFFC7C4D8);

  // Brand
  static const Color primary = Color(0xFF3525CD);
  static const Color primaryContainer = Color(0xFF4F46E5); // Electric Indigo
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryFixed = Color(0xFFE2DFFF);

  static const Color secondary = Color(0xFF0058BE);
  static const Color secondaryContainer = Color(0xFF2170E4); // Cobalt Blue
  static const Color secondaryFixed = Color(0xFFD8E2FF);

  static const Color tertiary = Color(0xFF005338);
  static const Color tertiaryContainer = Color(0xFF10B981); // Emerald Green

  static const Color error = Color(0xFFBA1A1A);

  // Semantic accents used in the design (registration-number icon, etc.)
  static const Color emerald = Color(0xFF059669);
  static const Color amber = Color(0xFFF59E0B);
  static const Color crimson = Color(0xFFEF4444);
}

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.surface,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryContainer,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        tertiary: AppColors.tertiaryContainer,
        surface: AppColors.surface,
        error: AppColors.error,
        brightness: Brightness.light,
      ),
    );

    final headlineFont = GoogleFonts.plusJakartaSans;
    final bodyFont = GoogleFonts.inter;

    final textTheme = TextTheme(
      // display-lg
      displayLarge: headlineFont(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        height: 48 / 40,
        letterSpacing: -0.025 * 40,
        color: AppColors.onSurface,
      ),
      // headline-lg
      headlineLarge: headlineFont(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 36 / 28,
        letterSpacing: -0.02 * 28,
        color: AppColors.onSurface,
      ),
      // headline-md
      headlineMedium: headlineFont(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 28 / 22,
        letterSpacing: -0.015 * 22,
        color: AppColors.onSurface,
      ),
      // headline-sm
      headlineSmall: headlineFont(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 24 / 18,
        letterSpacing: -0.01 * 18,
        color: AppColors.onSurface,
      ),
      // body-lg
      bodyLarge: bodyFont(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        letterSpacing: -0.01 * 16,
        color: AppColors.onSurface,
      ),
      // body-md
      bodyMedium: bodyFont(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        color: AppColors.onSurfaceVariant,
      ),
      // body-sm
      bodySmall: bodyFont(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        letterSpacing: 0.005 * 12,
        color: AppColors.onSurfaceVariant,
      ),
      // label-lg
      labelLarge: bodyFont(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
        letterSpacing: 0.01 * 14,
        color: AppColors.onSurface,
      ),
      // label-md
      labelMedium: bodyFont(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 16 / 12,
        letterSpacing: 0.02 * 12,
        color: AppColors.onSurfaceVariant,
      ),
      // label-sm
      labelSmall: bodyFont(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        height: 14 / 11,
        letterSpacing: 0.04 * 11,
        color: AppColors.onSurfaceVariant,
      ),
    );

    return base.copyWith(
      textTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceContainerLow,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              const BorderSide(color: AppColors.primaryContainer, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error, width: 1.4),
        ),
        hintStyle: bodyFont(color: AppColors.outline, fontSize: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryContainer,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: headlineFont(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          elevation: 2,
          shadowColor: AppColors.primaryContainer.withValues(alpha: 0.25),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: bodyFont(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.01 * 14,
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? AppColors.primaryContainer
              : AppColors.surfaceContainer,
        ),
      ),
    );
  }
}