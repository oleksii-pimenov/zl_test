import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zl_test/gen/assets.gen.dart';
import 'package:zl_test/src/core/theme/app_colors.dart';
import 'package:zl_test/src/core/theme/app_dimensions.dart';
import 'package:zl_test/src/core/theme/app_typography.dart';
import 'package:zl_test/src/features/avatar/presentation/logic/avatar_provider.dart';
import 'package:zl_test/src/features/avatar/presentation/widgets/avatar_card.dart';
import 'package:zl_test/src/features/avatar/presentation/widgets/filter_bar.dart';
import 'package:zl_test/src/shared/widgets/app_outlined_button.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({super.key});

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AvatarProvider>().loadUsers().ignore();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    if (_scrollController.position.pixels >= maxScroll * 0.9) {
      context.read<AvatarProvider>().loadUsers().ignore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPagePrimary,
      appBar: AppBar(
        backgroundColor: AppColors.bgPagePrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Assets.icons.close.svg(
            width: AppSizes.iconM,
            height: AppSizes.iconM,
            colorFilter: const ColorFilter.mode(
              AppColors.brandPrimary,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Consumer<AvatarProvider>(
        builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.m,
                ),
                child: Text(
                  'All avatars',
                  style: AppTypography.pageTitle,
                ),
              ),
              const SizedBox(height: AppSizes.xs),
              FilterBar(provider: provider),
              Expanded(
                child: _buildBody(context, provider),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, AvatarProvider provider) {
    if (provider.users.isEmpty && provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.users.isEmpty) {
      return _buildEmptyState(context, provider);
    }

    final w = MediaQuery.sizeOf(context).width;

    return GridView.builder(
      controller: _scrollController,
      padding: EdgeInsets.fromLTRB(w * 0.05, AppSizes.l, w * 0.05, AppSizes.l),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 112 / 152,
        crossAxisSpacing: AppSizes.cardPadding,
        mainAxisSpacing: AppSizes.cardPadding,
      ),
      itemCount: provider.users.length,
      itemBuilder: (context, index) => AvatarCard(user: provider.users[index]),
    );
  }

  Widget _buildEmptyState(BuildContext context, AvatarProvider provider) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.xl * 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.img.cup.image(
              width: 165,
              height: 165,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: AppSizes.l),
            const Text(
              'Nothing was found using these filters',
              textAlign: TextAlign.center,
              style: AppTypography.emptyStateTitle,
            ),
            if (provider.hasActiveFilters) ...[
              const SizedBox(height: AppSizes.xl),
              AppOutlinedButton(
                label: 'Clear filters',
                onPressed: provider.clearFilters,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
