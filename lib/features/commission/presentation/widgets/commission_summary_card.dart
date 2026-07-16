import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class CommissionSummaryCard extends StatelessWidget {
  final String salePrice;
  final String commissionRate;
  final String commissionAmount;

  const CommissionSummaryCard({
    super.key,
    required this.salePrice,
    required this.commissionRate,
    required this.commissionAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFF9500),
            Color(0xFFFF6900),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('سعر البيع',
                  style: AppTextStyle.headline3.copyWith(color: AppColors.surface)),
              Text(salePrice,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(color: Colors.white24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('نسبة العمولة',
                  style: AppTextStyle.headline3.copyWith(color: AppColors.surface)),
              Text(commissionRate,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(color: Colors.white24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('المبلغ المطلوب',
                  style: AppTextStyle.headline3
                      .copyWith(color: AppColors.surface)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(commissionAmount,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text('ريال سعودي',
                      style: AppTextStyle.headline2
                          .copyWith(color: AppColors.surface)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
