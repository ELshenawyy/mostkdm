// features/advertisement/presentation/sections/seller_section.dart

import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/advertisement/data/ad_models.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/contact_button.dart';
import 'package:mostkdm/features/advertisement/presentation/section/header_section.dart';

class SellerSection extends StatelessWidget {
  final AdDetailsModel ad;

  const SellerSection({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: 0.10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان
          const HeaderSection(
            label: 'بيانات المعلن',
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(ad.seller.image),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ad.seller.name, style: AppTextStyle.textFieldHeader),
                  Text(
                    '${ad.seller.memberSince} إعلان آخر',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              Spacer(),
              AppButton(
                label: 'متابعة',
                onTap: () {},
                kind: AppButtonKind.secondary,
                width: 100,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ContactButton(
                icon: Icons.facebook_outlined,
                label: 'واتساب',
                backgroundColor: const Color(0xFF25D366),
                onTap: () {},
              ),
              const SizedBox(width: 8),
              ContactButton(
                icon: Icons.chat_bubble_outline,
                label: 'محادثة',
                backgroundColor: AppColors.primaryColor,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              ContactButton(
                icon: Icons.call_outlined,
                label: 'اتصال',
                backgroundColor: AppColors.secondaryColor,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
