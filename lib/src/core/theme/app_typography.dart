import 'package:flutter/material.dart';
import 'package:zl_test/src/core/theme/app_colors.dart';

class AppTypography {
  static const String fontFamily = 'Italian Plate No2 Expanded';

  static const TextStyle h1 = pageTitle;
  static const TextStyle bodyL = buttonLabel;

  static const TextStyle pageTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static const TextStyle emptyStateTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  static const TextStyle filterLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle cardName = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
    color: AppColors.neutralsWhite,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.neutralsWhite80,
  );

  static const TextStyle optionTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.1,
    color: AppColors.textPrimary,
  );

  static const TextStyle optionSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  static const TextStyle buttonLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.35,
    letterSpacing: 0,
    color: AppColors.neutralsWhite,
  );

  static const TextStyle outlinedButtonLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle badgeLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 9,
    fontWeight: FontWeight.w700,
    color: AppColors.neutralsWhite,
  );

  static TextTheme get textTheme => const TextTheme(
    displayLarge: pageTitle,
    bodyLarge: optionTitle,
  );
}
