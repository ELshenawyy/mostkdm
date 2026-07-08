import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

enum AppSearchFieldStyle { light, dark }

class AppSearchField extends StatelessWidget {
  final String hint;
  final VoidCallback? onFilterTap;
  final VoidCallback? onFieldTap;

  final AppSearchFieldStyle style;

  const AppSearchField({
    super.key,
    this.hint = 'ابحث عن ما تريد',
    this.onFilterTap,
    this.style = AppSearchFieldStyle.light,
    this.onFieldTap,
  });

  Color get _fillColor => style == AppSearchFieldStyle.light
      ? AppColors.surface
      : AppColors.primaryHintColorWithOpacity;

  Color get _iconColor => style == AppSearchFieldStyle.light
      ? AppColors.textHintColor
      : AppColors.surface;

  Color get _textColor => style == AppSearchFieldStyle.light
      ? AppColors.textHintColor
      : AppColors.surface;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onFieldTap,
            child: AbsorbPointer(
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                      color: _textColor, fontSize: 14, fontFamily: 'Cairo'),
                  prefixIcon: Icon(Icons.search, color: _iconColor, size: 24),
                  filled: true,
                  fillColor: _fillColor,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
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
              color: _fillColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.tune, color: _iconColor),
          ),
        ),
      ],
    );
  }
}
