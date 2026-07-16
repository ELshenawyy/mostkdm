// features/commission/presentation/sections/commission_ads_section.dart

import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/features/commission/presentation/widgets/commission_ad_item.dart';

class CommissionAdsSection extends StatelessWidget {
  final void Function(Map<String, dynamic> ad) onAdTap;

  const CommissionAdsSection({super.key, required this.onAdTap});

  static final _ads = [
    {
      'image': AppImages.car,
      'title': 'بلايستيشن فايف مع 5 ألعاب',
      'price': '₴ 2,100',
      'isPaid': false,
    },
    {
      'image': AppImages.car,
      'title': 'تويوتا كامرى 2024 فل كامل 250 ألف كيلو',
      'price': '₴ 75,100',
      'isPaid': true,
    },
    {
      'image': AppImages.car,
      'title': 'بلايستيشن فايف مع 5 ألعاب',
      'price': '₴ 3,100',
      'isPaid': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('إختر الإعلان المباع', style: AppTextStyle.headline3),
        const SizedBox(height: 4),
        Text(
          'حدد الإعلان الذي تم بيعه لحساب العمولة',
          style: AppTextStyle.textFieldHeader,
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _ads.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) => CommissionAdItem(
            image: _ads[i]['image'] as String,
            title: _ads[i]['title'] as String,
            price: _ads[i]['price'] as String,
            isPaid: _ads[i]['isPaid'] as bool,
            onTap: () => onAdTap(_ads[i]),
          ),
        ),
      ],
    );
  }
}