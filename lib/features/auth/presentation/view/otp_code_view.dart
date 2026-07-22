import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mostkdm/features/auth/presentation/sections/login_header_section.dart';
import 'package:mostkdm/features/auth/presentation/sections/otp_check_section.dart';

class OtpcodeView extends StatefulWidget {
  final String phoneNumber;
  final bool isForgetPassword;

  const OtpcodeView({
    super.key,
    required this.phoneNumber,
    this.isForgetPassword = false,
  });

  @override
  State<OtpcodeView> createState() => _OtpcodeViewState();
}

class _OtpcodeViewState extends State<OtpcodeView> {
  String _otpCode = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            if (widget.isForgetPassword) {
              context.go(RouteNames.changePassword, extra: {
                'phone': widget.phoneNumber,
                'code': _otpCode,
              });
            } else {
              context.go(RouteNames.mainView);
            }
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 30,
              children: [
                const HeaderSection(
                    title: "أدخل رمز التحقق",
                    subtitle: "أرسلنا رمز مكون من 6 أرقام إلى رقمك",
                    imagePath: AppImages.shield),
                OtpCheckSection(
                  phone: widget.phoneNumber,
                  isForgetPassword: widget.isForgetPassword,
                  onSuccess: (otp) => setState(() => _otpCode = otp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
