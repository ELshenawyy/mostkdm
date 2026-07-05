import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/features/onBoarding/presentation/sections/splash_section.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SplashSection(),
          ]),
    );
  }
}
