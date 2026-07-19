import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/utils/app_validator.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/core/widgets/text_field_widget.dart';
import 'package:mostkdm/features/auth/presentation/bloc/auth_bloc.dart';

class SignupFormSection extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const SignupFormSection({super.key, required this.formKey});

  @override
  State<SignupFormSection> createState() => _SignupFormSectionState();
}

class _SignupFormSectionState extends State<SignupFormSection> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(children: [
          AppTextField(
            label: 'الإسم',
            controller: _nameController,
            suffixIcon: Icons.person_outlined,
            hintText: 'أحمد',
            validator: AppValidators.required,
          ),
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
          AppTextField(
            label: 'تأكيد كلمة المرور',
            isPassword: true,
            controller: _confirmPasswordController,
            suffixIcon: Icons.lock_outlined,
            hintText: '********',
            validator: (v) =>
                AppValidators.confirmPassword(v, _passwordController.text),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('هل أنت موافق على الشروط والأحكام؟',
                  style: AppTextStyle.forgetPasswordStyle),
            ],
          ),
          const SizedBox(height: 16),
          AppButton(
            label: 'إنشاء حساب',
            isLoading: state is AuthLoading,
            onTap: () {
              if (widget.formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(
                      SignupEvent(
                        name: _nameController.text,
                        phone: _phoneController.text,
                        password: _passwordController.text,
                      ),
                    );
              }
            },
          ),
          const SizedBox(height: 15),
          AppButton(
            label: 'تسجيل الدخول',
            onTap: () => context.go(RouteNames.login),
            kind: AppButtonKind.outline,
          ),
        ]);
      },
    );
  }
}
