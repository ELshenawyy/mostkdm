import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/payment_bottom_sheet.dart';

class SubscriptionSection extends StatefulWidget {
  const SubscriptionSection({super.key});

  @override
  State<SubscriptionSection> createState() => _SubscriptionSectionState();
}

class _SubscriptionSectionState extends State<SubscriptionSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الإشتراكات',
          style: AppTextStyle.headline3,
        ),

        SizedBox(
          height: 16,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.kayaking,
                color: AppColors.textFieldLabel,
                size: 35,
              ),
              Text(
                "لا يوجد إشتراك نشط",
                style: AppTextStyle.headline1.copyWith(
                  fontSize: 18,
                ),
              ),
              Text(
                "إختر طريقة النشر المناسبة لك من خلال دفع رسوم رمزية",
                style: AppTextStyle.headline2,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        SizedBox(
          height: 32,
        ),

        Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primaryColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('25',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor)),
                              Text(
                                ' ريال',
                                style:
                                    AppTextStyle.textBannerHeadline2.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 16),
                          Column(
                            children: [
                              Text('رسوم رمزية', style: AppTextStyle.headline3),
                              Text('للإعلان الواحد',
                                  style: AppTextStyle.textFieldLabel
                                      .copyWith(fontSize: 14)),
                            ],
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFeature('نشر فوري', 'إعلانك يظهر مباشرة'),
                      const SizedBox(width: 8, height: 12),
                      _buildFeature('بدون التزام', 'دفعة واحدة فقط'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    kind: AppButtonKind.secondary,
                    label: 'دفع 25 ريال ونشر',
                    onTap: () => showModalBottomSheet(
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
                                border: Border.all(
                                    color: AppColors.secondaryColor, width: 1.5),
                              ),
                              child: Icon(Icons.payment_outlined,
                                  color: AppColors.secondaryColor, size: 24),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // badge فوق
            Positioned(
              top: -12,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text('سريع ومناسب',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

// كارت التاني
        Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primaryColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('الباقات الشهرية', style: AppTextStyle.headline3),
                      Text(
                          'وفر حتى 60 % مع الباقات الشهرية وأحصل على مزايا حصرية',
                          style: AppTextStyle.textFieldLabel
                              .copyWith(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildPremiumFeature(
                      'إعلانات متعددة', 'من 5 إلى 40 إعلان شهرياً'),
                  SizedBox(height: 12),
                  _buildPremiumFeature('خصومات كبيرة', 'وفر حتى 1000 ريال'),
                  const SizedBox(height: 16),
                  AppButton(
                    label: 'إدارة باقتك المناسبة',
                    onTap: () {},
                    kind: AppButtonKind.secondary,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -12,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text('الأكثر شعبية',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeature(String label1, String label2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline,
              size: 21, color: AppColors.primaryColor),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label1, style: AppTextStyle.headline3),
              Text(label2,
                  style: AppTextStyle.textFieldLabel.copyWith(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumFeature(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline,
              size: 21, color: AppColors.primaryColor),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyle.headline3),
              Text(subtitle,
                  style: AppTextStyle.textFieldLabel.copyWith(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
