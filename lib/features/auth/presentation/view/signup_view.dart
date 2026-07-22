import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mostkdm/features/auth/presentation/sections/signup_form_section.dart';
import 'package:mostkdm/features/auth/presentation/sections/signup_header_section.dart';

import '../../../../core/router/router_names.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthOtpSent) {
            context.go(
              RouteNames.sendotp,
              extra: {
                'phone': state.phone,
                'isForgetPassword': false,
              },
            );
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
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SignupHeaderSection(),
                    SignupFormSection(formKey: _formKey),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
