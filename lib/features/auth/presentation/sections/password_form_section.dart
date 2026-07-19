import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/utils/app_validator.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/auth/presentation/bloc/auth_bloc.dart';

import '../../../../core/widgets/text_field_widget.dart';

class PasswordFormSection extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const PasswordFormSection({super.key, required this.formKey});

  @override
  State<PasswordFormSection> createState() => _PasswordFormSectionState();
}

class _PasswordFormSectionState extends State<PasswordFormSection> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          spacing: 15,
          children: [
            AppTextField(
              label: 'كلمة المرور القديمة',
              isPassword: true,
              controller: _oldPasswordController,
              hintText: '********',
              suffixIcon: Icons.lock_outlined,
              validator: AppValidators.password,
            ),
            AppTextField(
              label: ' كلمة المرور الجديدة',
              isPassword: true,
              controller: _newPasswordController,
              hintText: '********',
              suffixIcon: Icons.lock_outlined,
              validator: AppValidators.password,
            ),
            AppTextField(
              label: ' تأكيد كلمة المرور الجديدة',
              isPassword: true,
              controller: _newPasswordController,
              hintText: '********',
              suffixIcon: Icons.lock_outlined,
              validator: (v) =>
                  AppValidators.confirmPassword(v, _newPasswordController.text),
            ),
            AppButton(
              label: 'حفظ',
              isLoading: state is AuthLoading,
              onTap: () {
                if (widget.formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(LoginEvent(
                        phone: '',
                        password: _newPasswordController.text,
                      ));
                }
              },
            ),
          ],
        );
      },
    );
  }
}
