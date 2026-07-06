import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/features/home/presentation/widget/categories_item_widget.dart';

class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({super.key});

  static const _categories = [
    {'icon': AppImages.shield, 'label': 'سيارات'},
    {'icon': AppImages.shield, 'label': 'أثاث'},
    {'icon': AppImages.shield, 'label': 'ألعاب'},
    {'icon': AppImages.shield, 'label': 'إلكترونيات'},
    {'icon': AppImages.shield, 'label': 'أزياء'},
    {'icon': AppImages.shield, 'label': 'عقارات'},
    {'icon': AppImages.shield, 'label': 'خدمات'},
    {'icon': AppImages.shield, 'label': 'كتب'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('التصنيفات', style: AppTextStyle.buttonText),
              Text('عرض الكل',
                  style: AppTextStyle.forgetPasswordStyle
              ),
            ],
          ),
          const SizedBox(height: 16),
          // grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 8,
            ),
            itemCount: _categories.length,
            itemBuilder: (context, i) => CategoriesItemWidget(
              icon: _categories[i]['icon']!,
              label: _categories[i]['label']!,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
