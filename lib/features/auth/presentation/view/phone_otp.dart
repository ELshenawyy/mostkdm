import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mostkdm/features/auth/presentation/sections/login_header_section.dart';
import 'package:mostkdm/features/auth/presentation/sections/otp_form_section.dart';

class PhoneOtp extends StatefulWidget {
  const PhoneOtp({super.key});

  @override
  State<PhoneOtp> createState() => _PhoneOtpState();
}

class _PhoneOtpState extends State<PhoneOtp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthOtpSent) {
            context.go(RouteNames.sendotp, extra: {
              'phone': state.phone,
              "isForgotPassword": true,
            });
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
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 30,
                children: [
                  HeaderSection(
                    title: 'أدخل رقم الجوال',
                    subtitle: 'سنرسل لك رمز التحقق',
                    imagePath: AppImages.lock,
                  ),
                  OtpFormSection(
                    formKey: _formKey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
