import 'package:flutter/material.dart';
import 'package:zl_test/src/core/theme/app_colors.dart';
import 'package:zl_test/src/core/theme/app_dimensions.dart';
import 'package:zl_test/src/core/theme/app_typography.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown({
    required this.label,
    required this.onTap,
    this.badgeCount = 0,
    super.key,
  });

  final String label;
  final VoidCallback onTap;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.s),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.xs,
          vertical: AppSizes.cardPadding,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderLight),
          borderRadius: BorderRadius.circular(AppRadius.s),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: AppTypography.filterLabel),
            if (badgeCount > 0) ...[
              const SizedBox(width: AppSizes.xxs),
              Container(
                width: AppSizes.badgeSize,
                height: AppSizes.badgeSize,
                decoration: BoxDecoration(
                  color: AppColors.textPrimary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.neutralsWhite,
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    badgeCount.toString(),
                    style: AppTypography.badgeLabel,
                  ),
                ),
              ),
            ],
            const SizedBox(width: AppSizes.cardPadding),
            const Icon(
              Icons.keyboard_arrow_down,
              size: AppSizes.iconS,
              color: AppColors.textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
