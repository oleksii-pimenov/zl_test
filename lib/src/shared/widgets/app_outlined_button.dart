import 'package:flutter/material.dart';
import 'package:zl_test/src/core/theme/app_colors.dart';
import 'package:zl_test/src/core/theme/app_dimensions.dart';
import 'package:zl_test/src/core/theme/app_typography.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        minimumSize: const Size(0, AppSizes.buttonHeight),
        side: const BorderSide(color: AppColors.borderLight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.l),
      ),
      child: Text(label, style: AppTypography.outlinedButtonLabel),
    );
  }
}
