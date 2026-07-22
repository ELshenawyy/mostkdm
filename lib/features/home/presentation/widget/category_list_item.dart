import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class CategoryListItem extends StatelessWidget {
  final String image;
  final String title;
  final int count;
  final VoidCallback? onTap;
  final bool isSelected;

  const CategoryListItem({
    super.key,
    required this.image,
    required this.title,
    required this.count,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.primaryColor.withValues(alpha: 0.15),
            width: isSelected ? 1.5 : 0.5,
          ),
        ),
        child: Row(
          children: [
            Image.asset(image, width: 40, height: 40),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyle.textFieldHeader),
                Text('$count إعلان',
                    style: AppTextStyle.textFieldHeader
                        .copyWith(color: AppColors.textFieldLabel)),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: AppColors.textFieldLabel),
          ],
        ),
      ),
    );
  }
}
