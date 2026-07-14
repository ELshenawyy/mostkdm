import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/wallet/presentation/section/wallet_balance_section.dart';
import 'package:mostkdm/features/wallet/presentation/section/wallet_transactions_section.dart';
import 'package:mostkdm/features/wallet/presentation/widgets/recharge_bottom_sheet.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  void _showRechargeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          const RechargeBottomSheet(),
          Positioned(
            top: 0,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                    color: AppColors.primaryColor.withValues(alpha: 0.3)),
              ),
              child: Icon(Icons.account_balance_wallet_outlined,
                  color: AppColors.secondaryColor, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(
              height: 160,
              child: SafeArea(
                child: Column(
                  children: [
                    LocalAppBar(title: 'المحفظة', isLight: true),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -60),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    WalletBalanceSection(
                      onRechargeTap: () => _showRechargeSheet(context),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () => context.push(RouteNames.bankAccount),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:
                                AppColors.secondaryColor.withValues(alpha: 0.5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.edit_outlined,
                                    color: AppColors.secondaryColor, size: 18),
                                const SizedBox(width: 8),
                                Text('تعديل بيانات الحساب البنكي',
                                    style: AppTextStyle.textFieldHeader),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const WalletTransactionsSection(),
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
}
