import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

abstract class AppTextStyle {
  static const TextStyle headline1 = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.secondaryColor,
  );
  static const TextStyle headline2 = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textHintColor,
  );
  static const TextStyle headline3 = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryColor,
  );
  static const TextStyle buttonText = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textHintColor,
  );
  static const TextStyle textFieldHeader = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textHintColor,
  );
  static const TextStyle forgetPasswordStyle = TextStyle(
    fontFamily: 'Montserrat-Arabic',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
  static const TextStyle textFieldLabel = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textFieldLabel,
  );

  static const TextStyle textBannerHeadline1 = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.surface,
  );
    static const TextStyle textBannerHeadline2 = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.surface,
  );
}
