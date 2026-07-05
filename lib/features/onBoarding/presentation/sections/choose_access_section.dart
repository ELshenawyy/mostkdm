import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/core/widgets/app_button.dart';

class ChooseAccessSection extends StatelessWidget {
  const ChooseAccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          const Image(
            image: AssetImage(AppImages.logo),
            width: 209,
            height: 96,
          ),
          const SizedBox(height: 70),
          AppButton(
            label: 'تسجيل الدخول',
            onTap: ()=>context.go(RouteNames.login),
            kind: AppButtonKind.primary,
          ),
          const SizedBox(height: 16),
          AppButton(
            label: 'إنشاء حساب جديد',
            onTap: ()=>context.go(RouteNames.signup),
            kind: AppButtonKind.outline,
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}
