import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';

class PaymentBottomSheet extends StatefulWidget {
  const PaymentBottomSheet({super.key});

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  int _selectedPayment = 0;

  static const _paymentMethods = [
    'الدفع بالمحفظة',
    'بوابة دفع إلكترونية',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 28),
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('إختيار وسيلة الدفع', style: AppTextStyle.headline1),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text('قم بإختيار وسيلة الدفع للإشتراك في الباقة',
                  style: AppTextStyle.headline3),
            ),
            const SizedBox(height: 24),
            ...List.generate(
              _paymentMethods.length,
              (i) => GestureDetector(
                onTap: () => setState(() => _selectedPayment = i),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _selectedPayment == i
                          ? AppColors.secondaryColor
                          : AppColors.secondaryColor.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_paymentMethods[i],
                          style: AppTextStyle.textFieldHeader),
                      Radio<int>(
                        value: i,
                        groupValue: _selectedPayment,
                        activeColor: AppColors.primaryColor,
                        onChanged: (v) => setState(() => _selectedPayment = v!),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            AppButton(
              label: 'دفع',
              onTap: () => Navigator.pop(context),
              kind: AppButtonKind.secondary,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
