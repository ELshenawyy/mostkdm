import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class AdsAppBar extends StatelessWidget {
  const AdsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('الإعلانات المميزة', style: AppTextStyle.buttonText),
        Text('عرض الكل', style: AppTextStyle.forgetPasswordStyle),

      ],
    );
  }
}