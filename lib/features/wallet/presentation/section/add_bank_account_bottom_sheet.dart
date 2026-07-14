import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/core/widgets/text_field_widget.dart';
import 'package:mostkdm/features/wallet/presentation/widgets/bank_account_success_bottom_sheet.dart';

class AddBankAccountBottomSheet extends StatefulWidget {
  final VoidCallback? onSuccess;

  const AddBankAccountBottomSheet({super.key, this.onSuccess});

  @override
  State<AddBankAccountBottomSheet> createState() =>
      _AddBankAccountBottomSheetState();
}

class _AddBankAccountBottomSheetState extends State<AddBankAccountBottomSheet> {
  final _bankNameController = TextEditingController();
  final _ibanController = TextEditingController();
  final _accountNameController = TextEditingController();

  @override
  void dispose() {
    _bankNameController.dispose();
    _ibanController.dispose();
    _accountNameController.dispose();
    super.dispose();
  }

  void _showSuccessSheet() {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          BankAccountSuccessBottomSheet(onDetails: widget.onSuccess),
          Positioned(
            top: 0,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
              ),
              child: const Icon(Icons.check_circle_outline,
                  color: Colors.green, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child:
                  Text('بيانات الحساب البنكي', style: AppTextStyle.headline1),
            ),
            const SizedBox(height: 8),
            Center(
              child: const Text(
                'قم بإضافة بياناتك',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 24),
            AppTextField(
              label: 'اسم البنك',
              controller: _bankNameController,
              hintText: 'اسم البنك',
              fillColor: AppColors.surface,
            ),
            const SizedBox(height: 12),
            AppTextField(
              label: 'اسم صاحب الحساب',
              controller: _accountNameController,
              hintText: 'اسم صاحب الحساب',
              fillColor: AppColors.surface,
            ),
            const SizedBox(height: 12),
            AppTextField(
              label: 'رقم الآيبان',
              controller: _ibanController,
              hintText: 'رقم الآيبان',
              fillColor: AppColors.surface,
            ),
            const SizedBox(height: 24),
            AppButton(
              label: 'إضافة',
              onTap: _showSuccessSheet,
              kind: AppButtonKind.secondary,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
