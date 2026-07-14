import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class WalletBalanceSection extends StatelessWidget {
  final VoidCallback? onRechargeTap;

  const WalletBalanceSection({super.key, this.onRechargeTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF29C58),
                Color(0xFFFF6900),
                Color(0xFFF29C58),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('الرصيد الحالى',
                          style: AppTextStyle.headline3
                              .copyWith(color: Colors.white)),
                      Text('1000 @',
                          style: AppTextStyle.headline1.copyWith(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          )),
                      Text('متاح للإستخدام',
                          style: AppTextStyle.headline3
                              .copyWith(color: Colors.white)),
                    ],
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.account_balance_wallet_outlined,
                        color: AppColors.secondaryColor, size: 30),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'يمكنك إستخدام هذا الرصيد فى جميع معاملاتك داخل التطبيق سواء دفع أو سحب .',
                  style: AppTextStyle.textFieldHeader
                      .copyWith(color: AppColors.surface, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onRechargeTap,
          child: Container(
            width: double.infinity,
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.account_balance_wallet_outlined,
                        color: AppColors.primaryColor, size: 18),
                    const SizedBox(width: 8),
                    Text('شحن رصيد',
                        style: AppTextStyle.textBannerHeadline2
                            .copyWith(color: AppColors.primaryColor)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
