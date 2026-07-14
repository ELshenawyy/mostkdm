import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class WalletEmptySection extends StatelessWidget {
  const WalletEmptySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 80,
            color: AppColors.primaryColor.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text('لا توجد معاملات', style: AppTextStyle.headline1),
          const SizedBox(height: 8),
          const Text(
            'لا توجد معاملات حتى الآن',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}