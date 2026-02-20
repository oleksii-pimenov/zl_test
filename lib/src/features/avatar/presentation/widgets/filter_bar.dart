import 'package:flutter/material.dart';
import 'package:zl_test/gen/assets.gen.dart';
import 'package:zl_test/src/core/theme/app_colors.dart';
import 'package:zl_test/src/core/theme/app_dimensions.dart';
import 'package:zl_test/src/features/avatar/presentation/logic/avatar_provider.dart';
import 'package:zl_test/src/features/avatar/presentation/widgets/filter_sheets.dart';
import 'package:zl_test/src/shared/widgets/app_dropdown.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({required this.provider, super.key});

  final AvatarProvider provider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.m,
        vertical: AppSizes.cardPadding,
      ),
      child: Row(
        children: [
          if (provider.hasActiveFilters) ...[
            InkWell(
              onTap: provider.clearFilters,
              borderRadius: BorderRadius.circular(AppRadius.s),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.xs,
                  vertical: AppSizes.xs,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderLight),
                  borderRadius: BorderRadius.circular(AppRadius.s),
                ),
                child: Assets.icons.cross.svg(
                  width: AppSizes.iconXS,
                  height: AppSizes.iconXS,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSizes.cardPadding),
          ],
          AppDropdown(
            label: 'Gender',
            badgeCount: provider.selectedGenders.length,
            onTap: () => FilterSheets.showGenderFilter(context),
          ),
          const SizedBox(width: AppSizes.cardPadding),
          AppDropdown(
            label: 'Age',
            badgeCount: provider.selectedAges.length,
            onTap: () => FilterSheets.showAgeFilter(context),
          ),
          const SizedBox(width: AppSizes.cardPadding),
          AppDropdown(
            label: 'Pose',
            badgeCount: provider.selectedPoses.length,
            onTap: () => FilterSheets.showPoseFilter(context),
          ),
        ],
      ),
    );
  }
}
