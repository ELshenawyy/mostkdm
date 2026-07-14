import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/core/widgets/text_field_widget.dart';

class BankAccountSection extends StatefulWidget {
  const BankAccountSection({super.key});

  @override
  State<BankAccountSection> createState() => _BankAccountSectionState();
}

class _BankAccountSectionState extends State<BankAccountSection> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          label: 'اسم البنك',
          controller: _bankNameController,
          hintText: 'اسم البنك',
          fillColor: AppColors.surface,
        ),
        const SizedBox(height: 12),
        AppTextField(
          label: 'رقم الآيبان',
          controller: _ibanController,
          hintText: 'رقم الآيبان',
          fillColor: AppColors.surface,
        ),
        const SizedBox(height: 12),
        AppTextField(
          label: 'اسم صاحب الحساب',
          controller: _accountNameController,
          hintText: 'اسم صاحب الحساب',
          fillColor: AppColors.surface,
        ),
        const SizedBox(height: 24),
        AppButton(
          label: 'إضافة',
          onTap: () {},
        ),
      ],
    );
  }
}