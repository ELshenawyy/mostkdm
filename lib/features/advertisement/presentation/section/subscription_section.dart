// features/advertisement/presentation/section/subscription_section.dart

import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/core/widgets/app_subscription_card.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/payment_bottom_sheet.dart';

class SubscriptionSection extends StatelessWidget {
  const SubscriptionSection({super.key});

  void _showPaymentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          const PaymentBottomSheet(),
          Positioned(
            top: 0,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.secondaryColor, width: 1.5),
              ),
              child: Icon(Icons.payment_outlined,
                  color: AppColors.secondaryColor, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('الإشتراكات', style: AppTextStyle.headline3),
        const SizedBox(height: 16),
        // empty state
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.kayaking, color: AppColors.textFieldLabel, size: 35),
              Text('لا يوجد إشتراك نشط',
                  style: AppTextStyle.headline1.copyWith(fontSize: 18)),
              Text(
                'إختر طريقة النشر المناسبة لك من خلال دفع رسوم رمزية',
                style: AppTextStyle.headline2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // كارت رسوم رمزية
        AppSubscriptionCard(
          title: 'رسوم رمزية',
          subtitle: 'للإعلان الواحد',
          price: '25',
          badge: 'سريع ومناسب',
          icon: Icons.check_circle_outlined,
          features: const [
            SubscriptionFeature(
                title: 'نشر فوري', subtitle: 'إعلانك يظهر مباشرة'),
            SubscriptionFeature(
                title: 'بدون التزام', subtitle: 'دفعة واحدة فقط'),
          ],
          buttonLabel: 'دفع 25 ريال ونشر',
          onTap: () => _showPaymentSheet(context),
        ),
        const SizedBox(height: 24),
        // كارت الباقات الشهرية
        AppSubscriptionCard(
          title: 'الباقات الشهرية',
          subtitle: 'وفر حتى 60 % مع الباقات الشهرية وأحصل على مزايا حصرية',
          badge: 'الأكثر شعبية',
          icon: Icons.check_circle_outlined,
          features: const [
            SubscriptionFeature(
                title: 'إعلانات متعددة', subtitle: 'من 5 إلى 40 إعلان شهرياً'),
            SubscriptionFeature(
                title: 'خصومات كبيرة', subtitle: 'وفر حتى 1000 ريال'),
          ],
          buttonLabel: 'إدارة باقتك المناسبة',
          onTap: () {},
        ),
      ],
    );
  }
}
