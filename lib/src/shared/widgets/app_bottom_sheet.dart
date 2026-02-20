import 'package:flutter/material.dart';
import 'package:zl_test/gen/assets.gen.dart';
import 'package:zl_test/src/core/theme/app_colors.dart';
import 'package:zl_test/src/core/theme/app_dimensions.dart';
import 'package:zl_test/src/core/theme/app_typography.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    required this.child,
    this.title,
    super.key,
  });

  final Widget child;
  final String? title;

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AppBottomSheet(
        title: title,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: AppSizes.s,
        right: AppSizes.s,
        bottom: AppSizes.sheetBottomMargin,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgPagePrimary,
        borderRadius: BorderRadius.circular(AppRadius.sheet),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.m,
                AppSizes.m,
                AppSizes.m,
                AppSizes.cardPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title!, style: AppTypography.pageTitle),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Assets.icons.cross.svg(
                      width: AppSizes.iconS,
                      height: AppSizes.iconS,
                      colorFilter: const ColorFilter.mode(
                        AppColors.textPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.m,
                AppSizes.cardPadding,
                AppSizes.m,
                AppSizes.l,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
