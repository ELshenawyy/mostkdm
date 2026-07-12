import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';

class DeleteAdBottomSheet extends StatelessWidget {
  final VoidCallback onConfirm;

  const DeleteAdBottomSheet({super.key, required this.onConfirm});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('حذف الإعلان', style: AppTextStyle.headline1),
            const SizedBox(height: 8),
            const Text(
              'هل أنت متأكد من أنك تريد حذف هذا الإعلان',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            AppButton(
              label: 'حذف',
              onTap: () {
                Navigator.pop(context);
                onConfirm();
              },
              kind: AppButtonKind.primary,
            ),
            const SizedBox(height: 12),
            AppButton(
              label: 'إلغاء',
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