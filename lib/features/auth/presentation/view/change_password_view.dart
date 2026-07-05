import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/auth/presentation/sections/login_header_section.dart';
import 'package:mostkdm/features/auth/presentation/sections/password_form_section.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 30,
            children: [
              HeaderSection(
                title: 'تغيير كلمة المرور',
                subtitle: 'قم بتغيير كلمة المرور الخاصة بك',
                imagePath: AppImages.lock,
              ),
              PasswordFormSection(),
              AppButton(
                label: 'حفظ',
                onTap: () => context.go(RouteNames.signup),
                kind: AppButtonKind.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
