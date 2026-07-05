import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/widgets/app_button.dart';

class LoginNavigationSection extends StatelessWidget {
  const LoginNavigationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          AppButton(
            label: 'تسجيل الدخول',
            onTap: () {},  //TODO
            kind: AppButtonKind.primary,
          ),
          SizedBox(height: 15),
          AppButton(
            label: 'إنشاء حساب جديد',
            onTap: () => context.go(RouteNames.signup),
            kind: AppButtonKind.outline,
          ),
        ],
      ),
    );
  }
}
