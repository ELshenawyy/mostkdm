import 'package:flutter/material.dart';
import 'package:mostkdm/features/auth/presentation/sections/otp_action_section.dart';
import 'package:mostkdm/features/auth/presentation/widgets/app_otp_field.dart';

class OtpCheckSection extends StatefulWidget {
  const OtpCheckSection({super.key});

  @override
  State<OtpCheckSection> createState() => _OtpCheckSectionState();
}

class _OtpCheckSectionState extends State<OtpCheckSection> {
  final _otpController = TextEditingController();
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _otpController.addListener(() {
      setState(() => _isTyping = _otpController.text.length == 6);
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        AppOtpField(
          controller: _otpController,
          onCompleted: (_) {},
        ),
        OtpActionsSection(isCompleted: _isTyping),
      ],
    );
  }
}
