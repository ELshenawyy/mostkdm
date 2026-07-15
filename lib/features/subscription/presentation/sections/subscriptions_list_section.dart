import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_subscription_card.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';

class SubscriptionsListSection extends StatelessWidget {
  const SubscriptionsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // الباقة الشهرية
        AppSubscriptionCard(
          title: 'الباقة الشهرية',
          subtitle: 'وفر حتى 60% من الباقات الشهرية وأحصل على مزايا حصرية',
          price: '250',
          icon: Icons.check_circle_outline,
          badge: 'الأكثر مبيعاً',
          features: const [
            SubscriptionFeature(
                title: 'إعلانات متعددة',
                subtitle: 'من 5 إعلانات حتى 40 إعلان شهرياً'),
            SubscriptionFeature(
                title: 'خصومات كبيرة', subtitle: 'وفر حتى 1000 ريال'),
          ],
          buttonLabel: 'إشتراك',
          onTap: () => context.push(RouteNames.packageDetails),
        ),
        const SizedBox(height: 24),
        // الباقة النصف سنوية
        AppSubscriptionCard(
          title: 'الباقة النصف سنوية',
          subtitle: 'وفر حتى 60% من الباقات الشهرية وأحصل على مزايا حصرية',
          price: '500',
          icon: Icons.check_circle_outline,
          badge: 'الفرق الثاني',
          features: const [
            SubscriptionFeature(
                title: 'دعم متواصل', subtitle: 'خدمة عملاء على مدار 24 ساعة'),
            SubscriptionFeature(
                title: 'إعلانات متقدمة',
                subtitle: 'مقارنة الإعلانات برقم عالية'),
          ],
          buttonLabel: 'إشتراك',
          onTap: () => context.push(RouteNames.packageDetails),
        ),
        const SizedBox(height: 24),
        // الباقة السنوية
        AppSubscriptionCard(
          title: 'الباقة السنوية',
          subtitle: 'وفر حتى 60% من الباقات الشهرية وأحصل على مزايا حصرية',
          price: '850',
          badge: 'الأفضل قيمة',
          features: const [
            SubscriptionFeature(
                title: 'إعلانات مفتوحة', subtitle: 'وفر حتى 100 إعلان شهرياً'),
            SubscriptionFeature(
                title: 'خصومات كبيرة', subtitle: 'وفر حتى 2000 ريال'),
          ],
          buttonLabel: 'إشتراك',
          onTap: () => context.push(RouteNames.packageDetails),
        ),
      ],
    );
  }
}
