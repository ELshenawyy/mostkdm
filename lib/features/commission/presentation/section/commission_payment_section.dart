import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_bloc.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_event.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_state.dart';

import 'package:mostkdm/features/commission/presentation/widgets/commission_ad_item.dart';
import 'package:mostkdm/features/commission/presentation/widgets/commission_summary_card.dart';

class CommissionPaymentSection extends StatefulWidget {
  const CommissionPaymentSection({super.key});

  @override
  State<CommissionPaymentSection> createState() =>
      _CommissionPaymentSectionState();
}

class _CommissionPaymentSectionState extends State<CommissionPaymentSection> {
  int _selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommissionBloc, CommissionState>(
      builder: (context, state) {
        final ad = state.selectedAd ?? {};
        final calcModel = state.calculationModel;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            if (ad.isNotEmpty)
              CommissionAdItem(
                image: ad['image'] as String? ?? '',
                title: ad['title'] as String? ?? '',
                price: ad['price'] as String? ?? '',
                isPaid: ad['isPaid'] as bool? ?? false,
              ),
            const SizedBox(height: 16),
            Text('تأكيد الدفع', style: AppTextStyle.headline3),
            const SizedBox(height: 4),
            Text(
              'راجع التفاصيل وأختر طريقة الدفع',
              style: AppTextStyle.textFieldHeader,
            ),
            const SizedBox(height: 16),
            CommissionSummaryCard(
              salePrice: '${calcModel?.price ?? 0}',
              commissionRate: '${calcModel?.commissionPercentage ?? 5}%',
              commissionAmount: '${calcModel?.commissionAmount ?? 0}',
            ),
            const SizedBox(height: 16),
            Text('وسيلة الدفع', style: AppTextStyle.headline3),
            const SizedBox(height: 12),
            _buildPaymentOption(
              0,
              'المحفظة',
              'الرصيد: 850 ريال',
              Icons.account_balance_wallet_outlined,
            ),
            const SizedBox(height: 8),
            _buildPaymentOption(
              1,
              'بطاقة بنكية',
              'فيزا • مدى • ماستركارد',
              Icons.credit_card,
            ),
            const SizedBox(height: 24),
            AppButton(
              label: 'دفع',
              isLoading: state.isPayLoading,
              onTap: () {
                final method = _selectedPayment == 0 ? 'wallet' : 'card';
                context.read<CommissionBloc>().add(
                      PayCommissionEvent(paymentMethod: method),
                    );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildPaymentOption(
      int index, String title, String subtitle, IconData icon) {
    return GestureDetector(
      onTap: () => setState(() => _selectedPayment = index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _selectedPayment == index
                ? AppColors.primaryColor
                : AppColors.primaryColor.withValues(alpha: 0.1),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryColor),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyle.headline3),
                Text(subtitle, style: AppTextStyle.headline2),
              ],
            ),
            const Spacer(),
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
