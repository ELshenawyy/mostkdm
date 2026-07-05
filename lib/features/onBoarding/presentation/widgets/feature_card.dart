import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const FeatureCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 95,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(
          color: AppColors.secondaryColor.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          icon,
          color: AppColors.secondaryColor,
          size: 20,
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: AppTextStyle.textFieldHeader
              .copyWith(decoration: TextDecoration.none),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
