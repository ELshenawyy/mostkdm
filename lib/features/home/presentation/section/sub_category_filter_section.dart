import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

class SubCategoryFilterSection extends StatefulWidget {
  const SubCategoryFilterSection({super.key});

  @override
  State<SubCategoryFilterSection> createState() =>
      _SubCategoryFilterSectionState();
}

class _SubCategoryFilterSectionState extends State<SubCategoryFilterSection> {
  int _selectedIndex = 0;

  static const _filters = ['الكل', 'مرسيدس', 'كيا', 'نيسان', 'توياتا', 'سوناتا'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final isSelected = i == _selectedIndex;
          return FilterChip(
            label: Text(_filters[i]),
            selected: isSelected,
            onSelected: (_) => setState(() => _selectedIndex = i),
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