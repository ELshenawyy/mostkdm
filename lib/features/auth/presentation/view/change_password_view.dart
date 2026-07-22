import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mostkdm/features/auth/presentation/sections/login_header_section.dart';
import 'package:mostkdm/features/auth/presentation/sections/password_form_section.dart';

class ChangePasswordView extends StatefulWidget {
  final String? phone;
  final String? code;
  const ChangePasswordView({super.key, this.phone, this.code});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.go(RouteNames.login);
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 30,
                  children: [
                    HeaderSection(
                      title: 'تغيير كلمة المرور',
                      subtitle: 'قم بتغيير كلمة المرور الخاصة بك',
                      imagePath: AppImages.lock,
                    ),
                    PasswordFormSection(
                      formKey: _formKey,
                      phone: widget.phone,
                      code: widget.code,
                    ),
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
