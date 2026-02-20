import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color brandQuantumBlue70 = Color(0xFF000799);
  static const Color neutralsGrey100 = Color(0xFF020303);
  static const Color neutralsGrey400 = Color(0xFFB3B3B3);
  static const Color neutralsWhite = Color(0xFFFFFFFF);
  static const Color neutralsWhite80 = Color(0xCCFFFFFF);

  static const Color brandPrimary = Color(0xFF1A1A1A);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color bgPagePrimary = Color(0xFFFFFFFF);
  static const Color borderLight = Color(0xFFF2F4F6);
  static const Color borderMid = Color(0xFFCAD4DD);
  static const Color cardBorder = Color(0x0D000000);
  static final Gradient avatarGradient = LinearGradient(
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.black.withValues(alpha: 0.1),
      Colors.black.withValues(alpha: 0.8),
    ],
    stops: const [0.5, 0.7, 1.0],
  );

  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: brandPrimary,
    error: Color(0xFFFF1F00),
    onSurface: textPrimary,
  );

  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: brandQuantumBlue70,
    surface: Color(0xFF0B0D0E),
    error: Color(0xFFFF1F00),
    onPrimary: neutralsWhite,
  );
}
