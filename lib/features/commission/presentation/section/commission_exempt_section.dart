import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/commission/presentation/widgets/commission_ad_item.dart';
import 'package:mostkdm/core/theme/app_images.dart';

class CommissionExemptSection extends StatelessWidget {
  const CommissionExemptSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Icon(Icons.check_circle_outline,
            size: 80, color: AppColors.primaryColor),
        const SizedBox(height: 16),
        Text('إعلان معفى', style: AppTextStyle.headline1),
        const SizedBox(height: 8),
        const Text(
          'تم نشر هذا الإعلان برسوم مسبقة\nلا يتطلب دفع عمولة إضافية',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
        const SizedBox(height: 24),
        CommissionAdItem(
          image: AppImages.car,
          title: 'تويوتا كامرى 2024 فل كامل 250 ألف كيلو',
          price: '₴ 75,100',
          isPaid: true,
        ),
        const SizedBox(height: 24),
        AppButton(
          label: 'العودة للرئيسية',
          onTap: () => context.go(RouteNames.mainView),
        ),
      ],
    );
  }
}
