import 'package:flutter/material.dart';
import 'package:zl_test/src/core/theme/app_colors.dart';
import 'package:zl_test/src/core/theme/app_dimensions.dart';
import 'package:zl_test/src/core/theme/app_typography.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: AppColors.lightColorScheme,
    textTheme: AppTypography.textTheme,
    scaffoldBackgroundColor: AppColors.bgPagePrimary,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bgPagePrimary,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.brandPrimary),
      centerTitle: true,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.brandPrimary,
        foregroundColor: AppColors.neutralsWhite,
        minimumSize: const Size(0, AppSizes.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
      ),
    ),
  );
}
