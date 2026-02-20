import 'package:flutter/material.dart';
import 'package:zl_test/src/core/theme/app_colors.dart';
import 'package:zl_test/src/core/theme/app_dimensions.dart';
import 'package:zl_test/src/core/theme/app_typography.dart';
import 'package:zl_test/src/features/avatar/domain/entities/user.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
        side: const BorderSide(color: AppColors.cardBorder),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.grey[200],
            child: Image.asset(
              user.avatarUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.person,
                size: AppSizes.iconM,
                color: Colors.grey,
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: AppColors.avatarGradient,
              ),
            ),
          ),
          Positioned(
            left: AppSizes.cardPadding,
            right: AppSizes.cardPadding,
            bottom: AppSizes.cardPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  user.firstName,
                  style: AppTypography.cardName,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${user.gender} • ${user.age}',
                  style: AppTypography.cardSubtitle,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
