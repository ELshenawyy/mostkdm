import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';

class BankAccountSuccessBottomSheet extends StatelessWidget {
    final VoidCallback? onDetails; 

  const BankAccountSuccessBottomSheet({super.key, this.onDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('تم إضافة الحساب البنكي بنجاح',
              style: AppTextStyle.headline1),
          const SizedBox(height: 8),
          const Text(
            'تم ربط بيانات حسابك البنكي بنجاح وبدأ الدفع منه',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          AppButton(
            label: 'تعديل المعلومات',
            onTap: () {
              Navigator.pop(context);
            },
            kind: AppButtonKind.secondary,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}