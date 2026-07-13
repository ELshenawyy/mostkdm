// features/settings/presentation/section/profile_info_section.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key});

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(AppImages.car),
                  ),
                  Positioned(
                    bottom: -10,
                    right: 20,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt_outlined,
                          color: Colors.white, size: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('سامر مغازي',
                            style: AppTextStyle.textBannerHeadline2
                                .copyWith(color: AppColors.secondaryColor)),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => context.push(RouteNames.editProfile),
                          child: Container(
                            width: 35,
                            height: 35,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit_outlined,
                              color: AppColors.surface,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم لومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد ',
                      style: AppTextStyle.textFieldHeader,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
              Icons.phone_outlined, 'رقم الهاتف', '0500000000', Colors.green),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.email_outlined, 'البريد الإلكتروني',
              'Samermghazy777@gmail.com', Colors.blue),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.location_on_outlined, 'الموقع',
              'الرياض، السعودية', Colors.red),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, subtitle, Color iconColor) {
    {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyle.textFieldHeader),
              Text(subtitle, style: AppTextStyle.headline3),
            ],
          ),
        ],
      );
    }
  }
}
