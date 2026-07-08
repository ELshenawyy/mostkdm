import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class SearchEmptySection extends StatelessWidget {
  const SearchEmptySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        Icon(Icons.search_off_outlined,
            size: 86, color: AppColors.errorColor),
        const SizedBox(height: 16),
        Text('لا توجد نتائج بحث',
            style: AppTextStyle.headline1),
        const SizedBox(height: 8),
        Text(
          'لا يوجد لديك نتائج بحث حتى الآن',
          style: AppTextStyle.headline2,),
        
      ],
    );
  }
}