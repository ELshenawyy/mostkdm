import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/commission/presentation/section/commission_ads_section.dart';
import 'package:mostkdm/features/commission/presentation/section/commission_exempt_section.dart';
import 'package:mostkdm/features/commission/presentation/section/commission_payment_section.dart';
import 'package:mostkdm/features/commission/presentation/section/commission_price_section.dart';

enum CommissionStep { ads, price, payment, exempt }

class CommissionView extends StatefulWidget {
  const CommissionView({super.key});

  @override
  State<CommissionView> createState() => _CommissionViewState();
}

class _CommissionViewState extends State<CommissionView> {
  CommissionStep _step = CommissionStep.ads;

  String _salePrice = '0';
  bool _isExempt = false;

  Map<String, dynamic> _selectedAd = {};

  void _onAdTap(Map<String, dynamic> ad) {
    setState(() {
      _selectedAd = ad;

      if (ad['isPaid'] == true) {
        _isExempt = true;
        _step = CommissionStep.exempt;
      } else {
        _isExempt = false;
        _step = CommissionStep.price;
      }
    });
  }

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
                  children: const [
                    LocalAppBar(
                      title: 'دفع العمولة',
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
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primaryColor.withValues(alpha: 0.1),
                    ),
                  ),
                  child: switch (_step) {
                    CommissionStep.ads => CommissionAdsSection(
                        onAdTap: _onAdTap,
                      ),

                    CommissionStep.price => CommissionPriceSection(
                        ad: _selectedAd,
                        onConfirm: (price) {
                          final salePrice =
                              double.tryParse(price) ?? 0;

                          final commission = salePrice * 0.05;

                          final total = salePrice + commission;

                          setState(() {
                            _salePrice = total.toStringAsFixed(0);
                            _step = CommissionStep.payment;
                          });
                        },
                      ),

                    CommissionStep.payment => CommissionPaymentSection(
                        ad: _selectedAd,
                        salePrice: _salePrice,
                      ),

                    CommissionStep.exempt => const CommissionExemptSection(),
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}