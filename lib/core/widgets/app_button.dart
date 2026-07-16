import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

enum AppButtonKind { primary, secondary, ghost,outline}

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final AppButtonKind kind;
  final bool isLoading;
  final double? width;
    final double? height;

  final IconData? icon;

  const AppButton({
    super.key,
    required this.label,
    required this.onTap,
    this.kind = AppButtonKind.primary,
    this.isLoading = false,
    this.width = double.infinity,
    this.icon, this.height = 65,
  });

  _ButtonColors get _colors => switch (kind) {
        AppButtonKind.primary => _ButtonColors(
            background: AppColors.primaryColor,
            text: Colors.white,
            border: Colors.transparent,
          ),
        AppButtonKind.secondary => _ButtonColors(
            background: AppColors.secondaryBtnBackground,
            text: AppColors.secondaryBtnText,
            border: Colors.transparent,
          ),
        AppButtonKind.outline => _ButtonColors(
            background: Colors.transparent,
            text: AppColors.primaryColor,
            border: AppColors.primaryColor,
          ),
        AppButtonKind.ghost => _ButtonColors(
            background: AppColors.ghostBtnBackground,
            text: AppColors.ghostBtnText,
            border: AppColors.ghostBtnBorder,
          ),
      };

  @override
  Widget build(BuildContext context) {
    final colors = _colors;
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.background,
          foregroundColor: colors.text,
          disabledBackgroundColor: colors.background,
          disabledForegroundColor: colors.text,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: colors.border, width: 1),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: colors.text),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  if (icon != null) Icon(icon, color: colors.text, size: 20),
                  Text(
                    label,
                    style: AppTextStyle.textFieldLabel.copyWith(
                      color: colors.text,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _ButtonColors {
  final Color background;
  final Color text;
  final Color border;
  const _ButtonColors({
    required this.background,
    required this.text,
    required this.border,
  });
}
