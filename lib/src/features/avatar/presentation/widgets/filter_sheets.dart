import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zl_test/src/core/theme/app_dimensions.dart';
import 'package:zl_test/src/core/theme/app_typography.dart';
import 'package:zl_test/src/features/avatar/domain/entities/user.dart';
import 'package:zl_test/src/features/avatar/presentation/logic/avatar_provider.dart';
import 'package:zl_test/src/shared/widgets/app_bottom_sheet.dart';
import 'package:zl_test/src/shared/widgets/app_checkbox.dart';

class FilterSheets {
  static Future<void> showGenderFilter(BuildContext context) {
    final provider = context.read<AvatarProvider>();
    return AppBottomSheet.show(
      context: context,
      title: 'Gender',
      child: _FilterSheetContent<String>(
        options: const [
          _FilterOptionData(value: 'Male', title: 'Men'),
          _FilterOptionData(value: 'Female', title: 'Women'),
        ],
        initialSelection: provider.selectedGenders,
        onSave: provider.setGenderFilters,
      ),
    );
  }

  static Future<void> showAgeFilter(BuildContext context) {
    final provider = context.read<AvatarProvider>();
    return AppBottomSheet.show(
      context: context,
      title: 'Age',
      child: _FilterSheetContent<AgeRange>(
        options: AgeRange.values
            .map(
              (a) => _FilterOptionData(
                value: a,
                title: a.displayName,
                subtitle: a.subtitle,
              ),
            )
            .toList(),
        initialSelection: provider.selectedAges,
        onSave: provider.setAgeFilters,
      ),
    );
  }

  static Future<void> showPoseFilter(BuildContext context) {
    final provider = context.read<AvatarProvider>();
    return AppBottomSheet.show(
      context: context,
      title: 'Pose',
      child: _FilterSheetContent<Pose>(
        options: Pose.values
            .map(
              (p) => _FilterOptionData(
                value: p,
                title: p.displayName,
              ),
            )
            .toList(),
        initialSelection: provider.selectedPoses,
        onSave: provider.setPoseFilters,
      ),
    );
  }
}

class _FilterOptionData<T> {
  const _FilterOptionData({
    required this.value,
    required this.title,
    this.subtitle,
  });
  final T value;
  final String title;
  final String? subtitle;
}

class _FilterSheetContent<T> extends StatefulWidget {
  const _FilterSheetContent({
    required this.options,
    required this.initialSelection,
    required this.onSave,
  });

  final List<_FilterOptionData<T>> options;
  final Set<T> initialSelection;
  final ValueChanged<Set<T>> onSave;

  @override
  State<_FilterSheetContent<T>> createState() => _FilterSheetContentState<T>();
}

class _FilterSheetContentState<T> extends State<_FilterSheetContent<T>> {
  late Set<T> _selected;

  @override
  void initState() {
    super.initState();
    _selected = Set.from(widget.initialSelection);
  }

  void _toggle(T value) {
    setState(() {
      if (_selected.contains(value)) {
        _selected.remove(value);
      } else {
        _selected.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...widget.options.map((option) {
          return AppCheckbox(
            title: option.title,
            subtitle: option.subtitle,
            value: _selected.contains(option.value),
            onChanged: (_) => _toggle(option.value),
          );
        }),
        const SizedBox(height: AppSizes.l),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () {
              widget.onSave(_selected);
              Navigator.of(context).pop();
            },
            child: const Text('Save', style: AppTypography.buttonLabel),
          ),
        ),
      ],
    );
  }
}
