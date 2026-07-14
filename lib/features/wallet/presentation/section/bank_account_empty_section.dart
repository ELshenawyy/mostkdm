import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/wallet/presentation/section/add_bank_account_bottom_sheet.dart';

class BankAccountEmptySection extends StatelessWidget {
  const BankAccountEmptySection({super.key});

  void _showAddAccountSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          AddBankAccountBottomSheet(
            onSuccess: () {
              Navigator.pop(context);
              // هتحدث الـ state بعدين من الـ Cubit
            },
          ),
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
              child: Icon(Icons.account_balance_outlined,
                  color: AppColors.primaryColor, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Icon(Icons.account_balance_outlined,
            size: 80,
            color: AppColors.primaryColor.withValues(alpha: 0.3)),
        const SizedBox(height: 16),
        Text('محفظتك غير مربوطة بحساب بنكي',
            style: AppTextStyle.headline1),
        const SizedBox(height: 8),
        const Text(
          'قم بإضافة بيانات حسابك البنكي لربطه بمحفظتك',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
        const SizedBox(height: 24),
        AppButton(
          label: 'إضافة الحساب البنكي',
          onTap: () => _showAddAccountSheet(context),
          kind: AppButtonKind.secondary,
        ),
      ],
    );
  }
}