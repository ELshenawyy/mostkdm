import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/auth/presentation/sections/login_header_section.dart';
import 'package:mostkdm/features/auth/presentation/sections/otp_form_section.dart';

class PhoneOtp extends StatelessWidget {
  const PhoneOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 30,
          children: [
            HeaderSection(
              title: 'أدخل رقم الجوال',
              subtitle: 'سنرسل لك رمز التحقق',
              imagePath: AppImages.lock,
            ),
            OtpFormSection(),
            AppButton(label: "إرسال", onTap: () {})
          ],
        ),
      ),
    );
  }
}
