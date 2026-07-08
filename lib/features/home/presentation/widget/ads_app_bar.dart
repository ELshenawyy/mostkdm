import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

class AdsAppBar extends StatelessWidget {
  const AdsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('الإعلانات المميزة', style: AppTextStyle.buttonText),
        GestureDetector(
          onTap: () => context.push(RouteNames.ads),
          child: Text('عرض الكل', style: AppTextStyle.forgetPasswordStyle)),

      ],
    );
  }
}