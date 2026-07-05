import 'package:flutter/material.dart';
import 'package:mostkdm/features/auth/presentation/widgets/app_otp_field.dart';

class OtpInputSection extends StatefulWidget {
  const OtpInputSection({super.key});

  @override
  State<OtpInputSection> createState() => _OtpInputSectionState();
}

class _OtpInputSectionState extends State<OtpInputSection> {
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppOtpField(
      controller: _otpController,
      onCompleted: (_) {},
    );
  }
}