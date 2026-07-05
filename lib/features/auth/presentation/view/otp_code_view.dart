import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/features/auth/presentation/sections/login_header_section.dart';
import 'package:mostkdm/features/auth/presentation/sections/otp_check_section.dart';

class OtpcodeView extends StatelessWidget {
  const OtpcodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 30,
          children: [
            const HeaderSection(
                title: "أدخل رمز التحقق",
                subtitle: "أرسلنا رمز مكون من 6 أرقام إلى رقمك",
                imagePath: AppImages.shield),
                
                
            const OtpCheckSection(),
            
          ],
        ),
      ),
    );
  }
}
