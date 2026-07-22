import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/features/home/data/models/category_model.dart';
import 'package:mostkdm/features/home/presentation/widget/categories_item_widget.dart';

class HomeCategoriesSection extends StatelessWidget {
  final List<CategoryModel> categories; // ← جديد

  const HomeCategoriesSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('التصنيفات', style: AppTextStyle.buttonText),
              GestureDetector(
                onTap: () => context.push(RouteNames.categories),
                child: Text(
                  'عرض الكل',
                  style: AppTextStyle.forgetPasswordStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 8,
            ),
            itemCount: categories.length,
            itemBuilder: (context, i) => CategoriesItemWidget(
              image: categories[i].image, // ← network image
              label: categories[i].name,
              onTap: () => context.push(
                RouteNames.subCategory,
                extra: categories[i].name,
              ),
            ),
          ),
        ],
      ),
    );
  }
}