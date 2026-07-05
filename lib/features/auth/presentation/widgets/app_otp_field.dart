// core/widgets/app_otp_field.dart

import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:pinput/pinput.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

class AppOtpField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onCompleted;

  const AppOtpField({
    super.key,
    required this.controller,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTheme = PinTheme(
      width: 52,
      height: 52,
      textStyle: AppTextStyle.headline1.copyWith(fontSize: 21),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.secondaryColor.withValues(alpha: 0.10),
        ),
      ),
    );

    return Pinput(
      controller: controller,
      length: 6,
      defaultPinTheme: defaultTheme,
      focusedPinTheme: defaultTheme.copyWith(
        decoration: defaultTheme.decoration!.copyWith(
          border: Border.all(color: AppColors.primaryColor, width: 1.5),
        ),
      ),
      submittedPinTheme: defaultTheme.copyWith(
        decoration: defaultTheme.decoration!.copyWith(
          border: Border.all(color: AppColors.primaryColor, width: 1.5),
        ),
      ),
      onCompleted: onCompleted,
    );
  }
}
