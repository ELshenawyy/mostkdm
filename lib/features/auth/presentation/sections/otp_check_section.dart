import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mostkdm/features/auth/presentation/sections/otp_action_section.dart';
import 'package:mostkdm/features/auth/presentation/widgets/app_otp_field.dart';

class OtpCheckSection extends StatefulWidget {
  final String phone;

  const OtpCheckSection({super.key, required this.phone});

  @override
  State<OtpCheckSection> createState() => _OtpCheckSectionState();
}

class _OtpCheckSectionState extends State<OtpCheckSection> {
  final _otpController = TextEditingController();
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _otpController.addListener(() {
      setState(() => _isCompleted = _otpController.text.length == 6);
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
          onCompleted: (_) {
            context.read<AuthBloc>().add(OtpEvent(
                  phone: widget.phone,
                  otp: _otpController.text,
                ));
          },
        ),
        OtpActionsSection(isCompleted: _isCompleted),
      ],
    );
  }
}
