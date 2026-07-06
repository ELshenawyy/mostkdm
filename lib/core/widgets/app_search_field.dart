import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

class AppSearchField extends StatelessWidget {
  final String hint;
  final VoidCallback? onFilterTap;

  const AppSearchField({
    super.key,
    this.hint = 'ابحث عن ما تريد',
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: AppColors.surface,
                fontSize: 14,
              ),
              prefixIcon:
                  Icon(Icons.search, color: AppColors.surface, size: 24),
              filled: true,
              fillColor: AppColors.primaryHintColorWithOpacity,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        GestureDetector(
          onTap: onFilterTap,
          child: Container(
            width: 53,
            height: 58,
            decoration: BoxDecoration(
              color: AppColors.primaryHintColorWithOpacity,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.tune, color: AppColors.surface),
          ),
        ),
      ],
    );
  }
}
