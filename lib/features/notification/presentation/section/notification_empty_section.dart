import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class NotificationsEmptySection extends StatelessWidget {
  const NotificationsEmptySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Icon(
              Icons.notifications_off_outlined,
              size: 80,
              color: AppColors.primaryColor.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text('لا توجد إشعارات', style: AppTextStyle.headline1),
            const SizedBox(height: 8),
            const Text(
              'لا يوجد لديك إشعارات حتى الآن',
              textAlign: TextAlign.center,
              style: AppTextStyle.headline2,
            ),
          ],
        ),
      ),
    );
  }
}