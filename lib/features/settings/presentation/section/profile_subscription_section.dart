import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class ProfileSubscriptionSection extends StatelessWidget {
  const ProfileSubscriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // العنوان
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('حالة الإشتراك',
                  style: AppTextStyle.textFieldHeader
                      .copyWith(color: AppColors.secondaryColor)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('نشط',
                    style: AppTextStyle.buttonText
                        .copyWith(color: AppColors.surface)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.calendar_month_outlined,
                color: AppColors.primaryColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(' ينتهي الإشتراك في 2026/4/30',
                      style: AppTextStyle.headline3.copyWith(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('باقي 49 يوم على الإنتهاء',
                          style: AppTextStyle.textFieldHeader),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
