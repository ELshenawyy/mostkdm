import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class NoAdsSection extends StatelessWidget {
  const NoAdsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_box_outlined,
              size: 80,
              color: AppColors.primaryColor.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text('لا يوجد إعلانات', style: AppTextStyle.headline1),
            const SizedBox(height: 8),
            const Text(
              'لا يوجد لديك إعلانات حتى الآن',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}