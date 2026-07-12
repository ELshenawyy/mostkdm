import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';

class AppConfirmBottomSheet extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? confirmLabel; 
  final VoidCallback? onConfirm; 
  final AppButtonKind confirmKind;

  const AppConfirmBottomSheet({
    super.key,
    required this.title,
    required this.subtitle,
    this.confirmLabel,
    this.onConfirm,
    this.confirmKind = AppButtonKind.primary,
  });

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
            Text(title, style: AppTextStyle.headline1),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyle.headline2,
            ),
            const SizedBox(height: 24),
            if (confirmLabel != null && onConfirm != null) ...[
              AppButton(
                label: confirmLabel!,
                onTap: () {
                  Navigator.pop(context);
                  onConfirm!();
                },
                kind: confirmKind,
              ),
              const SizedBox(height: 12),
              AppButton(
                label: 'إلغاء',
                onTap: () => Navigator.pop(context),
                kind: AppButtonKind.outline,
              ),
            ],
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
