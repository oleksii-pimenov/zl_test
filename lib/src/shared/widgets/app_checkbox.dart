import 'package:flutter/material.dart';
import 'package:zl_test/src/core/theme/app_colors.dart';
import 'package:zl_test/src/core/theme/app_dimensions.dart';
import 'package:zl_test/src/core/theme/app_typography.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle,
    super.key,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.xs),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: AppTypography.optionTitle),
                  if (subtitle != null) ...[
                    const SizedBox(height: AppSizes.xxs),
                    Text(subtitle!, style: AppTypography.optionSubtitle),
                  ],
                ],
              ),
            ),
            const SizedBox(width: AppSizes.s),
            Container(
              width: AppSizes.checkboxSize,
              height: AppSizes.checkboxSize,
              decoration: BoxDecoration(
                color: value ? AppColors.brandPrimary : Colors.transparent,
                border: Border.all(
                  color: value ? AppColors.brandPrimary : AppColors.borderMid,
                ),
                borderRadius: BorderRadius.circular(AppRadius.checkbox),
              ),
              child: value
                  ? const Icon(
                      Icons.check,
                      size: AppSizes.iconS,
                      color: AppColors.neutralsWhite,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
