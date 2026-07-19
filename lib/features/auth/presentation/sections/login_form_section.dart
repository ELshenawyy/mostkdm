import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/utils/app_validator.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/core/widgets/text_field_widget.dart';
import 'package:mostkdm/features/auth/presentation/bloc/auth_bloc.dart';

class LoginFormSection extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const LoginFormSection({super.key, required this.formKey});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            AppTextField(
              label: 'رقم الجوال',
              controller: _phoneController,
              suffixIcon: Icons.phone_outlined,
              hintText: '05xxxxxxxx',
              validator: AppValidators.phone,
            ),
            AppTextField(
              label: 'كلمة المرور',
              isPassword: true,
              controller: _passwordController,
              suffixIcon: Icons.lock_outlined,
              hintText: '********',
              validator: AppValidators.password,
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => context.go(RouteNames.forgetPassword),
                  child: Text('هل نسيت كلمة المرور؟',
                      style: AppTextStyle.forgetPasswordStyle),
                ),
              ],
            ),
            const SizedBox(height: 8),
            AppButton(
              label: 'تسجيل الدخول',
              isLoading: state is AuthLoading,
              onTap: () {
                if (widget.formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(LoginEvent(
                        phone: _phoneController.text,
                        password: _passwordController.text,
                      ));
                }
              },
            ),
            const SizedBox(height: 15),
            AppButton(
              label: 'إنشاء حساب جديد',
              onTap: () => context.go(RouteNames.signup),
              kind: AppButtonKind.outline,
            ),
          ],
        );
      },
    );
  }
}
