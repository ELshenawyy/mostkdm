import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/core/widgets/text_field_widget.dart';
import 'package:mostkdm/features/wallet/presentation/bloc/wallet_bloc.dart';

class RechargeBottomSheet extends StatefulWidget {
  const RechargeBottomSheet({super.key});

  @override
  State<RechargeBottomSheet> createState() => _RechargeBottomSheetState();
}

class _RechargeBottomSheetState extends State<RechargeBottomSheet> {
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _onRechargePressed() {
    final amountText = _amountController.text.trim();
    final amount = double.tryParse(amountText);

    if (amount != null && amount > 0) {
      // 1. إرسال الحدث للـ Bloc لشحن الرصيد
      context.read<WalletBloc>().add(RechargeWalletEvent( amount));

      // 2. إغلاق الـ Bottom Sheet
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('برجاء إدخال مبلغ شحن صحيح'),
          backgroundColor: Colors.red,
        ),
      );
    }
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('شحن رصيد', style: AppTextStyle.headline1),
            const SizedBox(height: 8),
            const Text(
              'قم بإدخال مبلغ الشحن الذي تريد شحنه',
              style: AppTextStyle.headline2,
            ),
            const SizedBox(height: 24),
            AppTextField(
              label: 'مبلغ الشحن',
              controller: _amountController,
              hintText: 'مبلغ الشحن',
              keyboardType: TextInputType.number,
              fillColor: AppColors.surface,
            ),
            const SizedBox(height: 24),
            AppButton(
              label: 'شحن',
              onTap: _onRechargePressed, // 👈 استدعاء الدالة عند الضغط
              kind: AppButtonKind.secondary,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}