import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/auth/presentation/view/signup_view.dart';

class SignupNavigationSection extends StatelessWidget {
  const SignupNavigationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          AppButton(
            label: 'إنشاء حساب جديد',
            onTap: () => context.go(RouteNames.signup),
            kind: AppButtonKind.secondary,
          ),
          SizedBox(height: 15),
          AppButton(
            label: 'تسجيل الدخول',
            onTap: ()=> context.go(RouteNames.login),
            kind: AppButtonKind.outline,
          ),
          
        ],
      ),
    );
  }
}
