import 'package:flutter/material.dart';

import '../../../../core/widgets/text_field_widget.dart';

class PasswordFormSection extends StatefulWidget {
  const PasswordFormSection({super.key});

  @override
  State<PasswordFormSection> createState() => _PasswordFormSectionState();
}

class _PasswordFormSectionState extends State<PasswordFormSection> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        AppTextField(
          label: 'كلمة المرور القديمة',
          isPassword: true,
          controller: _oldPasswordController,
          hintText: '********',
          suffixIcon: Icons.lock_outlined,
        ),
        AppTextField(
          label: ' كلمة المرور الجديدة',
          isPassword: true,
          controller: _newPasswordController,
          hintText: '********',
          suffixIcon: Icons.lock_outlined,
        ),
        AppTextField(
          label: ' تأكيد كلمة المرور الجديدة',
          isPassword: true,
          controller: _newPasswordController,
          hintText: '********',
          suffixIcon: Icons.lock_outlined,
        ),
      ],
    );
  }
}
