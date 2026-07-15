import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/app_subscription_card.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';

class PackageDetailsView extends StatefulWidget {
  final bool isActive;

  const PackageDetailsView({super.key, this.isActive = false});

  @override
  State<PackageDetailsView> createState() => _PackageDetailsViewState();
}

class _PackageDetailsViewState extends State<PackageDetailsView> {
  int _selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(
              height: 120,
              child: SafeArea(
                child: Column(
                  children: [
                    LocalAppBar(
                      title: 'تفاصيل الباقة',
                      isLight: true,
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // الكارد
                    AppSubscriptionCard(
                      title: 'الباقة الشهرية',
                      subtitle:
                          'وفر حتى 60% من الباقات الشهرية وأحصل على مزايا حصرية',
                      badge: 'الأكثر مبيعاً',
                      buttonLabel:
                          widget.isActive ? 'تجديد الإشتراك' : 'إشتراك',
                      onTap: () {},
                      icon: widget.isActive
                          ? Icons.check_circle
                          : Icons.circle_outlined,
                      features: const [
                        SubscriptionFeature(
                          title: 'تاريخ بدء الإشتراك',
                          subtitle: '2026/3/20',
                        ),
                        SubscriptionFeature(
                          title: 'تاريخ نهاية الإشتراك',
                          subtitle: '2026/20/4',
                        ),
                        SubscriptionFeature(
                          title: 'إعلانات متبقية',
                          subtitle: '7 إعلانات متبقية',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'إختيار وسيلة الدفع',
                          style: AppTextStyle.headline1.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('قم بإختيار وسيلة الدفع للإشتراك في الباقة',
                            style: AppTextStyle.headline2),
                      ],
                    ),

                    const SizedBox(height: 12),
                    Container(
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
                          if (widget.isActive)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text('نشط',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              ),
                            ),
                          if (!widget.isActive) ...[
                            const SizedBox(height: 12),
                            _buildPaymentOption(0, 'الدفع بالمحفظة'),
                            const SizedBox(height: 8),
                            _buildPaymentOption(1, 'بوابة دفع إلكترونية'),
                            const SizedBox(height: 16),
                            AppButton(
                              label: 'إشتراك',
                              onTap: () {},
                            ),
                            const SizedBox(height: 12),
                            AppButton(
                              label: 'ترقية الباقة',
                              onTap: () {},
                              kind: AppButtonKind.secondary,
                            ),
                          ] else ...[
                            const SizedBox(height: 16),
                            AppButton(
                              label: 'تجديد الإشتراك',
                              onTap: () {},
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(int index, String label) {
    return GestureDetector(
      onTap: () => setState(() => _selectedPayment = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _selectedPayment == index
                ? AppColors.primaryColor
                : AppColors.primaryColor.withValues(alpha: 0.1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyle.textFieldHeader),
            Radio<int>(
              value: index,
              groupValue: _selectedPayment,
              activeColor: AppColors.primaryColor,
              onChanged: (v) => setState(() => _selectedPayment = v!),
            ),
          ],
        ),
      ),
    );
  }
}
