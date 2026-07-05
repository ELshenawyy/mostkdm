import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/features/auth/presentation/sections/login_form_section.dart';
import 'package:mostkdm/features/auth/presentation/sections/login_header_section.dart';
import 'package:mostkdm/features/auth/presentation/sections/login_navigation_section.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            HeaderSection(
              title: 'مرحبا بعودتك',
              subtitle: 'سجل دخولك للمتابعة',
              imagePath: AppImages.onBoardingIcon,
            ),
            LoginFormSection(),
            LoginNavigationSection(),
          ],
        ),
      ),
    );
  }
}
