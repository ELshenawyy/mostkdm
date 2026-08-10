import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_bloc.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_event.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_state.dart';

import 'package:mostkdm/features/commission/presentation/widgets/commission_ad_item.dart';

class CommissionPriceSection extends StatelessWidget {
  const CommissionPriceSection({super.key});

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
            Text('سعر البيع النهائي', style: AppTextStyle.headline3),
            const SizedBox(height: 4),
            Text(
              'أدخل المبلغ الذي تم البيع فيه',
              textAlign: TextAlign.right,
              style: AppTextStyle.textFieldHeader,
            ),
            const SizedBox(height: 16),
            if (ad.isNotEmpty)
              CommissionAdItem(
                image: ad['image'] as String? ?? '',
                title: ad['title'] as String? ?? '',
                price: ad['price'] as String? ?? '',
                isPaid: ad['isPaid'] as bool? ?? false,
              ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Text('سعر البيع', style: AppTextStyle.textFieldHeader),
                  const SizedBox(height: 4),
                  Text(
                    '${calcModel?.price ?? 0} ₴',
                    style: AppTextStyle.headline1.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'العمولة المتوقعة (${calcModel?.commissionPercentage ?? 5}٪)',
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                Text(
                  '₴ ${calcModel?.commissionAmount ?? 0}',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            AppButton(
              label: 'دفع العمولة',
              isLoading: state.isCalculateLoading,
              onTap: () {
                context.read<CommissionBloc>().add(
                      const ChangeStepEvent(CommissionStep.payment),
                    );
              },
            ),
          ],
        );
      },
    );
  }
}