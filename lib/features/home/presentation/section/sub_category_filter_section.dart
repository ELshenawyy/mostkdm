import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';

class SubCategoryFilterSection extends StatefulWidget {
  final List<CategoryModel> subCategories;
  final void Function(int? subCategoryId) onSelected;

  const SubCategoryFilterSection({
    super.key,
    required this.subCategories,
    required this.onSelected,
  });

  @override
  State<SubCategoryFilterSection> createState() =>
      _SubCategoryFilterSectionState();
}

class _SubCategoryFilterSectionState extends State<SubCategoryFilterSection> {
  int? _selectedId;

  @override
  Widget build(BuildContext context) {
    final chips = <(String label, int? id)>[
      ('الكل', null),
      ...widget.subCategories.map((sc) => (sc.name, sc.id)),
    ];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final (label, id) = chips[i];
          final isSelected = id == _selectedId;
          return FilterChip(
            label: Text(label),
            selected: isSelected,
            onSelected: (_) {
              setState(() => _selectedId = id);
              widget.onSelected(id);
            },
            selectedColor: AppColors.primaryColor,
            backgroundColor: AppColors.surface,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : AppColors.secondaryColor,
              fontWeight: FontWeight.w500,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withValues(alpha: 0.15),
              ),
            ),
            showCheckmark: false,
          );
        },
      ),
    );
  }
}