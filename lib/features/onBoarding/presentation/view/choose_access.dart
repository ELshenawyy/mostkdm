import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/features/onBoarding/presentation/sections/choose_access_section.dart';

class ChooseAccess extends StatelessWidget {
  const ChooseAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: ChooseAccessSection(),
    );
  }
}
