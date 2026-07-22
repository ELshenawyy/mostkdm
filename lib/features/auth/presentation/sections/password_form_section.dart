import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/utils/app_validator.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/auth/presentation/bloc/auth_bloc.dart';

import '../../../../core/widgets/text_field_widget.dart';

class PasswordFormSection extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String? phone;
  final String? code;

  const PasswordFormSection(
      {super.key, required this.formKey, this.phone, this.code});

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
            if (widget.phone == null)
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
              controller: _confirmPasswordController,
              hintText: '********',
              suffixIcon: Icons.lock_outlined,
              validator: AppValidators.password,
              onChanged: (_) => widget.formKey.currentState?.validate(),
            ),
            AppButton(
  label: 'حفظ',
  isLoading: state is AuthLoading,
  onTap: () {
    if (widget.formKey.currentState!.validate()) {
      if (widget.phone != null) {
        context.read<AuthBloc>().add(ResetPasswordEvent(
          phone: widget.phone!,
          code: widget.code!,
          password: _newPasswordController.text,
        ));
      } else {
        context.read<AuthBloc>().add(ChangePasswordEvent(
          oldPassword: _oldPasswordController.text,
          newPassword: _newPasswordController.text,
        ));
      }
    }
  },
),
          ],
        );
      },
    );
  }
}
